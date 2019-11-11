import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bottomNavigation.dart';

class AccountInfo extends StatefulWidget
{
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  // String uid;
  
  //  @override
  //  void initState()
  //  {
  //    this.uid='';
  //   super.initState();
  //    FirebaseAuth.instance
  //       .currentUser()
  //       .then((val){
  //         setState(() {
  //          this.uid=val.uid; 
  //         });
         

  //       });
  // }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User's Account Info"),
          backgroundColor:Colors.blue,
        ),
        bottomNavigationBar: bottomnavigation(context,1),
        drawer: theDrawer(context),
        body:FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          return Text("\n   Mobile Number:  "+snapshot.data.phoneNumber,style: TextStyle(color:Colors.red,fontSize:SizeConfig.blockSizeVertical * 2.5),);
        }
        else {
          return Text('Loading...');
        }
      },
    ),
      ),
      );
  }
}
