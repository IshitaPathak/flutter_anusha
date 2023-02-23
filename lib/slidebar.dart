
import 'package:flutter/material.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/home.dart';

class slidebar extends StatelessWidget {
  //final Padding=EdgeInsets.symmetric(horizontal: 20);
  const slidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    drawer: Drawer( child: Container(
        child:ListView(
          children: [
            ListTile(
              leading:Icon(Icons.home),
              title: Text("Home"),
              
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> const home()),);
              },
              
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.account_box),
               onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> const about()),);
              
               },
            ),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.contact_mail),
                 onTap:()  {Navigator.push(context,MaterialPageRoute(builder: (context)=> const contact()),);
  }
            )
          ],) ),
    ),);

  }
}
 