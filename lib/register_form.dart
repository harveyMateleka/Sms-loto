import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart'  ;
import 'package:fluttertoast/fluttertoast.dart';

import 'navBar.dart';


class Registrer extends StatefulWidget {
  @override
  State<Registrer> createState() => _RegistrerState();
}    

class _RegistrerState extends State<Registrer> {
  static const TextStyle kheading=TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,);
    TextEditingController txtemail= new TextEditingController(),txtname= new TextEditingController();
    TextEditingController txttel= new TextEditingController(),txtcompte= new TextEditingController();
    CollectionReference utilisateur = FirebaseFirestore.instance.collection('utilisateur');
  @override

   Future saveslider() async {
     if (txtemail.text!='' && txttel.text!='' && txtcompte.text!='' && txtname.text !='') { 
        var data={
          'email':txtemail.text,
          'name':txtname.text,
          'telephone':txttel.text,
          'compte':txtcompte.text
        };
          var teste= await FirebaseFirestore.instance.collection('utilisateur').where('telephone',isNotEqualTo:txttel.text).get();
          if(teste.docs.isEmpty){
            utilisateur.add(data);
             message();
             return null;
          }
          else{
               Fluttertoast.showToast(
                msg:"le numero existe deja",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 5
            );
          }
           
     }
   
  }
    void message(){
    Fluttertoast.showToast(
        msg:"operation reussie",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5
    );
    txtemail.clear();
    txtname.clear();
    txttel.clear();
    txtcompte.clear();
  }

 Widget build(BuildContext context) {
    final _key = GlobalKey<FormFieldState>();
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
        title: Text("SMS LOTO",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign:TextAlign.center,),
      ),
      resizeToAvoidBottomInset :  false,
      body: Container(
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
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:65,),
            Padding(
              padding: EdgeInsets.all(10,),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Loterie",textAlign: TextAlign.left,style:TextStyle(color: Colors.white,fontSize:50)),
                  SizedBox(height:10,),
                  Text("Inscrivez vous",textAlign: TextAlign.left,style:TextStyle(color: Colors.white,fontSize:30)),
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
                          padding: EdgeInsets.all(30,),
                          margin: EdgeInsets.symmetric(horizontal:10),
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
                                padding: EdgeInsets.all(10,),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blue.shade300))
                                ),
                                child:TextField(
                                    controller:txtemail,
                                    decoration: InputDecoration(
                                      hintText:"entrez votre email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon:Icon(Icons.mail, color:Colors.blue, size: 25),
                                    ),
                                    keyboardType: TextInputType.text),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),),
                              Container(
                                padding: EdgeInsets.all(10,),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blue.shade300))
                                ),
                                child:TextField(
                                    controller:txtname,
                                    decoration: InputDecoration(
                                      hintText:"votre nom",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon:Icon(Icons.person, color:Colors.blue, size: 25),
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: false),
                              ),
                               Container(
                                padding: EdgeInsets.all(10,),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blue.shade300))
                                ),
                                child:TextField(
                                    controller:txttel,
                                    decoration: InputDecoration(
                                      hintText:"Saisir votre numero telephone",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon:Icon(Icons.phone, color:Colors.blue, size: 25),
                                    ),
                                    keyboardType: TextInputType.number,
                                    obscureText: false),
                              ),
                               Container(
                                padding: EdgeInsets.all(10,),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blue.shade300))
                                ),
                                child:TextField(
                                    controller:txtcompte,
                                    decoration: InputDecoration(
                                      hintText:"Compte",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon:Icon(Icons.lock_open, color:Colors.blue, size: 25),
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: false),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),),
                              Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal:5),
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FlatButton(
                                    child: Text("Enregistrer",textAlign: TextAlign.center,style: TextStyle(color:Colors.white)),
                                    onPressed:saveslider,
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

        ),
      ),
    );
  }
}