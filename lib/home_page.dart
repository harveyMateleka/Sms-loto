import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'message_send.dart';
import 'navBar.dart';
import 'register_form.dart';
class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu_page(),
    );
  }
}
class Menu_page extends StatefulWidget {
  @override
  _Menu_pageState createState() => _Menu_pageState();
}

class _Menu_pageState extends State<Menu_page> {
  @override
  Card makeDashboardItem(String title,String img, int index){
    return Card(
        elevation: 2,
        margin: const EdgeInsets.all(8),
        child:Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.0 , 0.0),
              end: FractionalOffset(3.0,-1.0),
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF)]),
                boxShadow: const [BoxShadow(
                  color: Colors.white,
                  blurRadius: 3,
                  offset: Offset(2,2),

                )]
          ),
          child: InkWell(
            onTap: (){
                switch(index) {
                  case 0:{
                          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Message_send()),
                              );
                  }
                  break;
                  case 1:{
                    Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Registrer()),
                              );

                  }
                  break;
                   case 2:{

                  }
                  break;
                  default: {

                  }
                   break;
                }
            },
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: [
                SizedBox(height: 50,),
                Center(
                  child: Image.asset(img,height: 100.0,width: 100.0),
                ),
                 SizedBox(height: 50,),
                  Center(
                  child: Text(title,style: TextStyle(color:Colors.blue[30],fontSize:20.0,fontWeight: FontWeight.bold)),
                ),
              ],
            )
          )
        ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 178, 193, 232),
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Home",textAlign: TextAlign.center,style: TextStyle(fontSize: 10.0),)
      ),
      body:Column(
        children:<Widget>[
            SizedBox(height: 50,),
            Expanded(child: GridView.count(
              crossAxisCount:2,
              padding: EdgeInsets.all(2),
              children: [
                makeDashboardItem("Message",'images/send_image.jpg',0),
                makeDashboardItem("Save Number",'images/phone.jpg',1),
                makeDashboardItem("Parametre",'images/send_image.jpg',0),
                makeDashboardItem("Aide",'images/phone.jpg',1),
               
              ], ),)

        ],
      ),
    );
  }
}

