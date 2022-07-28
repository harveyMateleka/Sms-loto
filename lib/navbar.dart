import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_form.dart';
import 'message_send.dart';
import 'navBar.dart';
class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  String name="";
  String get_email="";

  void getshar() async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      name=  pref.getString('name').toString();
      get_email= pref.getString('email').toString();
    });
    pref.commit();
  }

  @override
  void initState(){
    super.initState();
    //getshar();
  }
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(get_email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/user.png', width: 90,height: 90,fit: BoxFit.cover,),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                image: DecorationImage(
                  image: AssetImage('images/background1.jpg'),fit: BoxFit.cover,
                )

            ),
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text('message'),
            onTap: ()=>Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Message_send())),
          ),
       
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Save Number'),
            onTap:  ()=>Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Registrer())),

          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Parametre'),
            onTap: ()=>null,

          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Aide'),
            onTap: ()=>null,

          ),
    
        ],
      ),
    );
  }
}

