import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subscription extends StatefulWidget{
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription for Daily Milk"),
      ),
    bottomNavigationBar: bottomnavigation(context, 2),
    drawer: theDrawer(context),
    body: WillPopScope(
          onWillPop: (){
            Navigator.pushNamed(context, 'HomeScreen');
          },
       child: Text("\n\n\n  Subscription plan will be started soon",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
           
    ),
    );
  }
}