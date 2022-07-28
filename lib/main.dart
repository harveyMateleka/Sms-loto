import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:smsloto/register_form.dart';
import 'package:smsloto/home_page.dart';
import 'dart:async';
import 'widgetfold/background.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'smsloto-c712d.web.app');
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void _teste(){
    Timer(Duration(seconds: 5), ()=> Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home_page()),
    ));
  }

  void initState(){
    super.initState();
    _teste();
  }
  Widget build(BuildContext context) {
    return Stack(
      children:[
         Scaffold(
          backgroundColor: Colors.blue[10],
           body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius:100,
                    backgroundImage:AssetImage('images/lotorie.jpg'),
                  ),
                  SizedBox(height: 50,),
                  Text("SMS LOTO",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue,fontSize:50.0),)
               
           
           
                  ],
           ),
         ),
       // This trailing comma makes auto-formatting nicer for build methods.
    ),

      ],
     

    );
  }
}
