import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/widgets.dart';
import '../Arrangements/sizeModification.dart';
import 'package:carigari/screens/homescreen.dart';
import '../Arrangements/variables.dart'as global;

class SelectScreen extends StatefulWidget
{
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
   final GlobalKey<ScaffoldState> _scaffoldkey =new GlobalKey<ScaffoldState>();

   void callSnackBar(String me, [int err])
  {
    print("called me for scnack bar");
    if(err==2)
    {final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 10),
      action: new SnackBarAction(
        label: "EXIT",onPressed: (){
          // Navigator.pushNamed(context,"HomeScreen");
          exit(0);
     
        },
      ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 10),
      // action: new SnackBarAction(
      //   label: "OK",onPressed: (){
      //     Navigator.pushNamed(context,"HomeScreen");
     
      //   },
      // ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  
  @override
 initState(){
    // await new Future.delayed(const Duration(seconds : 5));
    sleep(const Duration(seconds: 5));
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
              if (currentUser == null)
                {
                  // status._islogin=false,
                  print("jp no user ra"),
                  Navigator.pushReplacementNamed(context, "Login")
                }
              else
                {
                
                  print("jp user yes ra"),
                  global.Phone=currentUser.phoneNumber,
                  global.EmailId=currentUser.email,
                  print(global.EmailId+global.Phone),
                  // Navigator.pushNamed(context, "Homescreen"),
                  Navigator.pushNamed(context,"HomeScreen"),
                  // Firestore.instance
                  //     .collection("users")
                  //     .document(currentUser.uid)
                  //     .get()
                  //     .then((DocumentSnapshot result) =>
                         
                  //        Navigator.pushNamed(context,"HomeScreen"),
                  //                     )
                  //     .catchError((err) => print(err))
                }
            })
        .catchError((err) => print(err));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
  //   void show() {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext ctxt) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("Exit Page",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
  //         content: new Text("Are you sure you want to exit from the APP",style: TextStyle(fontSize: 14.0),),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           new FlatButton(
  //             child: new Text("NO"),
  //             onPressed: () {
  //               // Navigator.of(context).pop();
  //               Navigator.push(
  //             ctxt,
  //             new MaterialPageRoute(builder: (ctxt) => new HomeScreen()),
  //           );
  //             },
  //           ),
  //           new FlatButton(
  //             child: new Text("YES, EXIT"),
  //             onPressed: () {
  //               exit(0);
  //               // Navigator.of(context).pop();
  //             },
  //           ),
            
  //         ],
  //       );
  //     },
  //   );
  // }
    // TODO: implement build
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      
      backgroundColor: Colors.orangeAccent,
      body:WillPopScope(
        
      onWillPop:()
      {
        print("going back");
        // Navigator.pushNamed(context,'');
        callSnackBar("Click EXIT to leave from APP",2);
      },
      child:Center(
         child:Column(children:<Widget>
        [
        // // children: <Widget>[
        //   new Center(
        //   child:Column(children: <Widget>[
        //     Text("\n\n\n\n\n\n\n\n\n\n\n\n\n\n "),
        //   InkWell(
        //       onTap: () =>Navigator.pushNamed(context, 'Login'),//write function jp
        //       child: new Container( 
        //         //width: 100.0,
        //         height: 50.0,
        //         decoration: new BoxDecoration(
        //           color: Colors.lime,
        //           border: new Border.all(color: Colors.green, width: 5.0),
        //           borderRadius: new BorderRadius.circular(10.0),
        //         ),

        //         child: new Center(child: new Text('Login', style: new TextStyle(fontSize: SizeConfig.blockSizeVertical *3, color: Colors.black),),),
        //       ),
        //     ),
        //     Text("\n"),
        //   InkWell(
        //       onTap: () => 
        //       {
        //         Navigator.pushNamed(context,'Register'),
        //       },//write function jp
        //       child: new Container( 
        //         //width: 100.0,
               
        //         height: 50.0,
        //         decoration: new BoxDecoration(
        //           color: Colors.lime,
        //           border: new Border.all(color: Colors.green, width: 5.0),
        //           borderRadius: new BorderRadius.circular(10.0),
        //         ),
        //         child: new Center(child: new Text('Register', style: new TextStyle(fontSize: SizeConfig.blockSizeVertical *3, color: Colors.black),),),
        //       ),
        //     ),
        //   ],
        //   ),
        //   ),
          // new Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     new FlatButton(
          //       onPressed: (){
          //         Navigator.pushNamed(context,'HomeScreen');
          //       },
          //       color: Colors.grey,
          //       child: Text("Skip"),
          //       )
          //   ],
          // ),
      ],
      ),
    ),

    )
    )
    );
  }
}