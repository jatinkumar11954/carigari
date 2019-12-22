import 'dart:io';

import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/homescreen.dart';
import 'package:carigari/screens/privacy.dart';
import 'package:carigari/screens/status.dart';
import 'package:carigari/screens/status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';
import 'package:carigari/Screens/splashScreen.dart';

// Widget theDrawer(BuildContext context)
// {
//   var status= StatusProvider.of(context);
//   return _theDrawer(context,status);
// }
void loggingOut(BuildContext context) {
  // ca
  FirebaseAuth.instance
      .signOut()
      // Navigator.pushNamed(context, "ScreenSelection");
      .then((result) =>
          //  Navigator.pushReplacementNamed(context, "Splash")

          Navigator.pushReplacementNamed(context, "ScreenSelection"))
      .catchError((err) => print(err));
  // exit(0);
  Navigator.of(context).pop();
}

Widget theDrawer(BuildContext context) {
  // void callSnackBar(String msg,[int er])
  // {
  //   final SnackBar=new prefix0.SnackBar(
  //     content:Text(msg),
  //     duration: new Duration(seconds: 3),

  //   )
  // }
  void show() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctxt) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Logout",
            style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.5),
          ),
          content: new Text(
            "Are you sure you want to Logout from the APP",
            style: TextStyle(fontSize: 14.0),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(true);

                //                     Navigator.of(context).pop();
                //     Navigator.push(
                //   ctxt,
                //   new MaterialPageRoute(builder: (ctxt) => new HomeScreen()),
                // );
                // Navigator.of(context).pop();
                //  Navigator.pushNamed(context, "ContactUs");
              },
            ),
            new FlatButton(
              child: new Text("Yes, Logout"),
              onPressed: () async {
                print("clicked yes");
                // loggingOut(context);
                await FirebaseAuth.instance
                    .signOut()
                    // Navigator.pushNamed(context, "ScreenSelection");
                    .then((result) =>
                        //  Navigator.pushReplacementNamed(context, "Splash")

                        //  Navigator.pushReplacementNamed(context, "ScreenSelection")
                        null)
                    .catchError((err) => print(err));
                // exit(0);
                print("after");
                Navigator.pushReplacementNamed(context, "ScreenSelection");
                print("success");
              },
            ),
          ],
        );
      },
    );
  }

// String status;
  // bool _isLogin=false;
  // // print(_isLogin);
  // FirebaseAuth.instance
  //       .currentUser()
  //       .then((currentUser) => {
  //             if (currentUser != null)
  //               {
  //                 _isLogin=true,
  //                 // status="Login",
  //                 print("jp user yes ra in drawer"),
  //                 print(_isLogin),

  //               }
  //             // else
  //             //   {
  //             //     _isLogin=false,
  //             //     // status="Logout",
  //             //     print("jp no user ra in drawer"),
  //             //     // Navigator.pushNamed(context, "Homescreen"),
  //             //   }
  //           })
  //       .catchError((err) => print(err));
  // // var status= StatusProvider.of(context);
  // theDrawer({this._isLogin});
  // if(param1==null)
  // {
  //   param1=false;
  // }
  // bool _islogin=param1;

  //  TextStyle newStyle = TextStyle(
  //   fontSize: 15,
  //   fontWeight: FontWeight.normal
  // );

  //  _islogin;
  return Drawer(
    child: new ListView(
      children: <Widget>[
        //  Text(checkLogin()),
        //  FlatButton(),
        // new DrawerHeader(

        //   child: Column(
        //     children: <Widget>[
        //       // new Container(
        //       //   height: 120,
        //        Text("LOGIN",style: TextStyle(),),
        // decoration: BoxDecoration(
        // color: Colors.blue,
        // ),
        //       //  color: Colors.white, fontWeight: FontWeight.normal
        //       // ),
        //     ],
        //   ),
        // ),
        // Widget:CheckLoginStatus,
        //   new ListTile(
        //    // title: new Text("Login/Register",style: newStyle),
        //    title: new Text("Login/Register"),
        //    leading: Icon(Icons.lock,color: Colors.black,),
        //    onTap: () {
        //      Navigator.pushNamed(context, 'Login');
        //    },
        //  ),
        //  new ListTile(
        //    leading: Icon(Icons.account_box,color:Colors.green),
        //    title: new Text("My Account"),
        //    // title: new Text('My Account',style:TextStyle(color:Colors.black),),
        //    onTap: () {
        //      Navigator.pushNamed(context,'AccountInfo');
        //    },
        //  ),
        // new Divider(),
        new ListTile(
          leading: new Icon(
            Icons.call,
            color: Colors.red,
          ),
          title: new Text('Contact Us'),
          onTap: () {
            Navigator.pushNamed(context, "ContactUs");
          },
        ),
        new ListTile(
          title: new Text('Live Chat'),
          leading: new Icon(Icons.chat_bubble_outline),
          onTap: () {
            print("whats app");
            //  var whatsappUrl ="whatsapp://send?phone=$phone";
            canLaunch("whatsapp://send?phone=+0919010590693") != null
                ? launch("whatsapp://send?phone=+0919010590693")
                : print(
                    "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
            // need to work if it wont work
          },
        ),
        new ListTile(
          leading: new Icon(Icons.edit),
          title: new Text('Contact Form'),
          onTap: () {
            Navigator.pushNamed(context, 'ContactForm');
          },
        ),
        new ListTile(
          leading: new Icon(Icons.code),
          title: new Text('About'),
          onTap: () {
            Navigator.pushNamed(context, 'About');
          },
        ),
        new ListTile(
          leading: new Icon(Icons.add_alert),
          title: new Text('Notifications'),
          onTap: () {
            Navigator.pushNamed(context, 'Notification');
          },
        ),
        // new Divider(color:Colors.red,),
        new ListTile(
          leading: new Icon(Icons.live_help),
          title: new Text('Help'),
          onTap: () {
            Navigator.pushNamed(context, 'Help');
          },
        ),
        new ListTile(
          title: new Text('Privacy Policy'),
          onTap: () {
            Navigator.pushNamed(context, 'Privacy');
          },
        ),

        //  new ListTile(
        //     title: new Text((_isLogin==true)?"Logout":""),
        //    // title: new Text(status),
        //    onTap: () {
        //      print(_isLogin);
        //      if(_isLogin==true)
        //      {
        //          print("logging out");
        //        // _isLogin=false;
        //        FirebaseAuth.instance
        //      .signOut()
        //      .then((result) =>
        //          Navigator.pushReplacementNamed(context, "HomeScreen"))
        //      .catchError((err) => print(err));

        //      }
        //      else{
        //       print("logging in");
        //        Navigator.pushNamed(context,'Login');
        //      }
        //    },
        //  ),
        //  new ListTile(
        //    title: new Text((_isLogin!=true)?"Login":""),
        //   // title: new Text(status),
        //   onTap: () {
        //     Navigator.pushNamed(context,'Login');
        //   }
        //  ),
        //   new ListTile(
        //     title: new Text(_isLogin?"LogOut":"Login"),
        //     onTap: () {
        //     if(status._islogin==true){
        //       status._islogin=false;
        //     FirebaseAuth.instance
        //       .signOut()
        //       .then((result) =>
        //           Navigator.pushReplacementNamed(context, "HomeScreen"))
        //       .catchError((err) => print(err));
        //     }
        //     else
        //     {
        //         Navigator.pushNamed(context,"Login");
        //     }
        //          },

        // ),

        //  new ListTile(
        //    title: new Text('Logout'),
        //    onTap: () {
        //      show();
        //       },
        //                  ),
      ],
    ),
  );
}

//  String checkLogin() {
// if(FirebaseAuth.instance.currentUser() != null){
//   return "Logout";

// }
// else if(FirebaseAuth.instance.currentUser() == null)
// {
//   return "Login";
// }

// }
