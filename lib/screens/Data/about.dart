import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/showImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget{
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.cyan[300],
        title: Text("About"),
      ),
    bottomNavigationBar: bottomnavigation(context, 1),
    drawer: theDrawer(context),
    body: WillPopScope(
          onWillPop: (){
            Navigator.pushNamed(context, 'HomeScreen');
          },
      //  child: Text("\n\n\n  About plan will be started soon",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
           child: Center(
             child: Column(
               children: <Widget>[
                  ShowImage("logo"),
          
           Text("About\n",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
            InkWell(
                    child: new Text('About Carigari Furnitures',style:TextStyle(fontSize: 20.0,color: Colors.red, decoration: TextDecoration.underline)),
                onTap: () async {
            if (await canLaunch("http://www.carigarifurniture.com//")) {
              await launch("http://www.carigarifurniture.com//");
            }
                }
                
                // launch("https://in.linkedin.com/in/jaya-prakash-veldanda-756b48179"),
              ),
               ],
             ),
           ),
    ),
    );
  }
}