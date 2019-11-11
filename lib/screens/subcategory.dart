import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget{
  // SubCategory(String msg, this.msg);
  
  // final int index;
  // SubCategory(this.msg);
  // final String msg;
  // final DocumentSnapshot a;
  // SubCategory(String msg, this.category);
  // final category;
  // final  msg;
  // SubCategory(String msg, int index, this.msg,);
  // SubCategory( this.category, this.index);
  // final category;
  // final index;
  // qp=await 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0XFF00099a9),
        // title: new Text(msg),
      ),
      drawer: theDrawer(context),
      bottomNavigationBar: bottomnavigation(context, 2),
      body: WillPopScope(
        onWillPop: ()
        {
          Navigator.pushNamed(context,"HomeScreen");
        },
        child: Center(
          // child: Text(category[0].data['a']),
        ),
      ),
    );
  }
  
}