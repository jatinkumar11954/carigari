import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget{
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return show();
  }
  Widget show() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctxt) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Exit Page",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
          content: new Text("Are you sure you want to exit from the APP",style: TextStyle(fontSize: 14.0),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("NO"),
              onPressed: () {
                // Navigator.of(context).pop();
               
             Navigator.pushNamed(context,"HomeScreen");
               },
            ),
            new FlatButton(
              child: new Text("YES, EXIT"),
              onPressed: () {
                print("cliked for log out yes");
                 FirebaseAuth.instance
                  .signOut()
                  .then((result) =>
                      Navigator.pushReplacementNamed(context, "login"))
                  .catchError((err) => print(err));
                // Navigator.of(context).pop();
              },
            ),
            
          ],
        );
      },
    );
  }
}