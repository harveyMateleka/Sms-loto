import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'navBar.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class Message_send extends StatefulWidget {
  const Message_send({Key? key}) : super(key: key);
  @override
  State<Message_send> createState() => _Message_sendState();
}

class _Message_sendState extends State<Message_send> {
  @override
List <String> liste_tel=[];
String? _message,msg_content;
Timer? _timer;


  getImageSliders() async{
    var _firebaseslider=FirebaseFirestore.instance;
    QuerySnapshot querytt=await _firebaseslider.collection('utilisateur').where("telephone",isEqualTo:"0820044887").get();
    setState(() {
      for(int a=0; a< querytt.docs.length;a++){
        if (querytt.docs[a]["telephone"]!='') {
          liste_tel.add(querytt.docs[a]["telephone"],);
        }
        
      }
    });
    print(liste_tel);
    return querytt.docs;
  }

 void _send_message() async {
  try {
    var content = "voici le resultat 07-12-85-02";

     String result= await sendSMS(message:content,recipients:liste_tel);
       setState(() {
                  _message = result;
                });
    //  _timer=new Timer(const Duration(seconds:10),(){
              
    //  }); 
     //reset();
  } catch (error) {
    setState(() => _message = error.toString());
  }
  }


  void reset() async{
  _timer?.cancel();
    try {

     String result= await sendSMS(message:"voici le resulat de loterie",recipients:liste_tel);
     _timer=new Timer(const Duration(seconds:10),(){
                setState(() {
                  _message = result;
                });
     }); 
  } catch (error) {
    setState(() => _message = error.toString());
  }
}

  @override
  void initState() {
    getImageSliders();
    //_send_message();
    super.initState();
  }
 

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
        title: Text("SMS LOTO",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign:TextAlign.center,),
      ),
      body:Container(
         width:double.infinity,
         decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors:[
                  Colors.blue.shade600,
                  Colors.blue.shade300,
                  Colors.blue.shade100,
                ]
            )
        ),
        child:ListView(
            children: <Widget>[
               Padding(
              padding: EdgeInsets.all(10,),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("LOTERIE",textAlign: TextAlign.left,style:TextStyle(color: Colors.white,fontSize:50)),
                  SizedBox(height:10,),
                  Text("Envoyez Message",textAlign: TextAlign.left,style:TextStyle(color: Colors.white,fontSize:30)),
                ],
              ),
            ),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Padding(
                  //padding: EdgeInsets.all(40,),
                  padding: EdgeInsets.only(left: 20.0,top: 100.0,right: 20.0,bottom: 200.0),
                  child: Column(
                      children:<Widget>[
                        Container(
                          padding: EdgeInsets.all(50,),
                          margin: EdgeInsets.symmetric(vertical:100,horizontal:10.0),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow:[BoxShadow(
                                  color:Color.fromARGB(225, 95, 27, 3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10) )

                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal:5),
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FlatButton(
                                    child: Text("Envoyez",textAlign: TextAlign.center,style: TextStyle(color:Colors.white)),
                                    onPressed:_send_message,
                                    textColor: Colors.white,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),),
              ),
            )
            ],
        )
      )

    );
  }
}