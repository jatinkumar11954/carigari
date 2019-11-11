// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:carigari/Arrangements/Drawer.dart';
// import 'package:carigari/Arrangements/sizeModification.dart';
// import 'package:carigari/screens/bottomNavigation.dart';
// import 'package:carigari/screens/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart' ;
// import 'package:flutter/material.dart' as prefix0;
// import 'package:flutter/widgets.dart';
// import "package:flutter/material.dart";
// import 'package:flutter/src/widgets/navigator.dart';

// class Details extends StatefulWidget
// {
//   Details({Key key}) : super(key: key);
//   @override
//   _DetailsState createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {
//   final GlobalKey<ScaffoldState> _scaffoldkey =new GlobalKey<ScaffoldState>();
//    final GlobalKey<FormState> _DetailsFormKey = GlobalKey<FormState>();
//   TextEditingController firstNameInput;
//   TextEditingController lastNameInput;
//   TextEditingController phoneNumberInput;
//   TextEditingController emailInput;
//   TextEditingController pwdInput;
//   TextEditingController confirmPwdInput;

//   @override
//   initState() {
//     firstNameInput = new TextEditingController();
//     lastNameInput = new TextEditingController();
//     emailInput = new TextEditingController();
//     phoneNumberInput=new TextEditingController();
//     pwdInput = new TextEditingController();
//     confirmPwdInput = new TextEditingController();
//     super.initState();
//   }
// void callSnackBar(String me, [int err])
//   {
//     print("called me for scnack bar");
//     if(err==2)
//     {final SnackBar =new prefix0.SnackBar(
//       content: new Text(me),
//       duration: new Duration(seconds: 5),
//       action: new SnackBarAction(
//         label: "EXIT",onPressed: (){
//           // Navigator.pushNamed(context,"HomeScreen");
//             exit(0);
//         },
//       ),
//       // backgroundColor: Colors.blue,
//     );
//     _scaffoldkey.currentState.showSnackBar(SnackBar);
//   }
//   else{
//     final SnackBar =new prefix0.SnackBar(
//       content: new Text(me),
//       duration: new Duration(seconds: 3),
//       // action: new SnackBarAction(
//       //   label: "OK",onPressed: (){
//       //     Navigator.pushNamed(context,"HomeScreen");
     
//       //   },
//       // ),
//       // backgroundColor: Colors.blue,
//     );
//     _scaffoldkey.currentState.showSnackBar(SnackBar);
//   }
//   }
//   // void callSnackBar(String msg)
//   // {
//   //   print("came here in snackbar");
//   //   final SnackBar=new SnackBar(
//   //     content:new Text(msg),
//   //     duration:new Duration(seconds: 5),
//   //     action:new SnackBarAction(
//   //       label: "Ok",
//   //       onPressed: (){
//   //         Navigator.pushNamed(context, "HomeScreen");
//   //       },
//   //     )
//   //   );
//   //   _scaffoldkey.currentState.showSnackBar(SnackBar);
//   // }

//   String emailValidator(String value) {
//     Pattern pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     if (!regex.hasMatch(value)) {
//       return 'Email format is invalid';
//     } else {
//       return null;
//     }
//   }
// String phoneValidator(String value)
// {
// if (value.length!=10) {
//       return 'Phone Number must be of 10 digits';
//     } else {
//       return null;
//     }
// }
 


//   @override
//   Widget build(BuildContext context) {
   

// //  void SuccessMsg() {
// //     // flutter defined function
// //     showDialog(
// //       context: context,
// //       barrierDismissible: true,
// //       builder: (BuildContext ctxt) {
// //         // return object of type Dialog
// //         return AlertDialog(
// //           title: new Text("Detailsed Successfully",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
// //           content: new Text("You are Detailsed successfully ,you can proceed ",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 1.7),),
// //           actions: <Widget>[
// //             // usually buttons at the bottom of the dialog
// //             // new FlatButton(
// //             //   child: new Text("Home"),
// //             //   onPressed: () {
// //             //     // Navigator.of(context).pop();
// //             //    Navigator.pushNamed(context, 'HomeScreen');
// //             //   },
// //             // ),
// //             // new FlatButton(
// //             //   child: new Text("YES, EXIT"),
// //             //   onPressed: () {
                
// //             //     // Navigator.of(context).pop();
// //             //   },
// //             // ),
            
// //           ],
// //         );
// //       },
// //     );
// //   }

//     TextStyle textStyle = Theme.of(context).textTheme.title;
//     // TODO: implement build
//       return new Scaffold(
//                    key:_scaffoldkey,
//                   // resizeToAvoidBottomPadding: false,
//                   appBar: AppBar(
//                     title: Text("Details Form"),
//                     backgroundColor: Colors.orangeAccent,
//                   ),
//                   // drawer: theDrawer(context),
//                   // bottomNavigationBar: bottomnavigation(context,0),
//                   body:WillPopScope(
//                   onWillPop:()
//                   {
//                     callSnackBar("Please fill this details");
                    
//                   },
//                   child: Container(
//                     // key: _DetailsFormKey,
//                     margin: EdgeInsets.all(SizeConfig.blockSizeVertical*1.5),
//                     child:Form(
//                        key: _DetailsFormKey,
//                       child: ListView(
//                       // key: _DetailsFormKey,
//                       children: <Widget>[
//                          Padding(
//                           padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                           child:TextFormField(
//                             style:textStyle,
//                           // keyboardType: Text(),
//                           controller: firstNameInput,
//                           // validator:(value)
//                           // {
//                           //   if(value.length<3)
//                           //   {
//                           //     return "plz enter a valid first name";
//                           //   }
                            
//                           // },
//                           decoration: InputDecoration(
//                             labelStyle:textStyle,
//                             labelText: "First Name",
//                             hintText: "Enter your First Name",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
//                             ),
//                           ),
//                           ),
//                         ),

//                          Padding(
//                           padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                           child:TextFormField(
//                             style:textStyle,
//                           // keyboardType: Text(),
//                           controller: lastNameInput,
//                           // validator: (value)
//                           // {
//                           //   if(value.length<3)
//                           //   {
//                           //     return "plz enter a valid Last name";
//                           //   }
                            
//                           // },
//                           decoration: InputDecoration(
//                             labelStyle:textStyle,
//                             labelText: "Last Name",
//                             hintText: "Enter your Last Name",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
//                             ),
//                           ),
//                           ),
//                         ),

//                         Padding(
//                           padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                           child:TextFormField(
//                             controller: emailInput,
//                             keyboardType: TextInputType.emailAddress,
//                             validator: emailValidator,
//                             style:textStyle,
//                           // keyboardType: Text(),
//                           decoration: InputDecoration(
//                             labelStyle:textStyle,
//                             labelText: "Email ",
//                             hintText: "Enter your Email",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
//                             ),
//                           ),
//                           ),
//                         ),


//                         Padding(
//                           padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                           child:TextFormField(
//                             controller: phoneNumberInput,
//                             maxLength: 10,
//                             validator: phoneValidator,
//                             keyboardType: TextInputType.number,
//                             style:textStyle,
//                           // keyboardType: Text(),
//                           decoration: InputDecoration(
//                             labelStyle:textStyle,
                            
//                             labelText: "Mobile",
//                             hintText: "Enter your Mobile Number ",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
//                             ),
//                           ),
//                           ),
//                         ),

//                         Padding(
//                           padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                           child:RaisedButton(
//                           child: Text("Enter"),
//                           color: Colors.green,
//                            onPressed: () {
//                              print("clicked Details button");
//                               if (_DetailsFormKey.currentState.validate()) {
//                                 if (pwdInput.text ==
//                                     confirmPwdInput.text) {
//                                       callSnackBar("Details are  adding" +firstNameInput.text+".....");
//                                       print("success");
//                                   FirebaseAuth.instance 
//                                       .createUserWithEmailAndPassword(
//                                           email: emailInput.text,
//                                   password: pwdInput.text)
//                                   .then((currentUser) => Firestore.instance
//                                       .collection("users")
//                                       .document(currentUser.uid)
//                                       .setData({
//                                         "password":pwdInput.text,
//                                         "uid": currentUser.uid,
//                                         "fname": firstNameInput.text,
//                                         "surname": lastNameInput.text,
//                                         "email": emailInput.text,
//                                         "mobile":phoneNumberInput.text,
                                        
//                                       })
//                                       .then((result) => {
//                                             callSnackBar("Successfully Added"),
//                                             // Navigator.pushAndRemoveUntil(
//                                             // context,
//                                             // MaterialPageRoute(
//                                             //     builder: (context) => HomePage(
//                                             //           title:
//                                             //               firstNameInput
//                                             //                       .text +
//                                             //                   "'s Tasks",
//                                             //           uid: currentUser.uid,
//                                             //         )
//                                             //         ),
//                                             // (_) => false),
//                                             // null,
//                                             Navigator.pushNamed(context,"HomeScreen"),
//                                         firstNameInput.clear(),
//                                         lastNameInput.clear(),
//                                         phoneNumberInput.clear(),
//                                         emailInput.clear(),
//                                         pwdInput.clear(),
//                                         confirmPwdInput.clear()
//                                       })
//                                   .catchError((err) => print(err)))
//                               .catchError((err) => print(err));
//                           } 
//                         else {
//                           print("fail");
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text("Error"),
//                                   content: Text("The passwords do not match"),
//                                   actions: <Widget>[
//                                     FlatButton(
//                                       child: Text("Close"),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                     )
//                                   ],
//                                 );
//                               });
//                         }
//                       }
//                       }
//                           )
//                         ),
//                         // Padding(
//                         //   padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                         //   child:Text("Do you have an Account, Then LOGIN here by clicking Sign in below:",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.7),)
//                         //   ),
//                         //  Padding(
//                         //   padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.1,bottom:SizeConfig.blockSizeVertical*1.5 ),
//                         //   child:RaisedButton(
//                         //   child: Text("Sign in"),
//                         //   color: Colors.blueAccent,
//                         //    onPressed: () {
//                         //                     Navigator.pushNamed(context,"Login");
//                         //              }
//                         //   ),
//                         //   ),
//                       ],
//                     ),
//                     ),
//                   ),
                    
//                   ),
//                     );

//   }
// }