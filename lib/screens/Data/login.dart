import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/homepage.dart';
import 'package:carigari/screens/status.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/material.dart' as prefix0;
import 'package:carigari/Arrangements/variables.dart' as global;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  int yes;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }
  void callSnackBar(String msg,[int er])
  {
    if(er==1)
    {
      msg="There is no record with this user, please register first by clicking Register or check the user mail id or Password";
      final SnackBar=new prefix0.SnackBar(
      content: new Text(msg),
      duration: new Duration(seconds: 10),
      action: new SnackBarAction(label: "Register",
      onPressed: (){
        Navigator.pushNamed(context, "Register");
      },),
    );
     _scaffoldKey.currentState.showSnackBar(SnackBar);
    }

    else if(er==2){
      final SnackBar=new prefix0.SnackBar(
      content: new Text(msg),
      duration: new Duration(seconds: 10),
      action: new SnackBarAction(label: "EXIT",
      onPressed: (){
        // Navigator.pushNamed(context, "Exit");
        exit(0);
      },),
    );
     _scaffoldKey.currentState.showSnackBar(SnackBar);
    }

    else{
          final SnackBar=new prefix0.SnackBar(
      content: new Text(msg),
      duration: new Duration(seconds: 2),

    );
    _scaffoldKey.currentState.showSnackBar(SnackBar);
  
    }
    }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // var status= StatusProvider.of(context);
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        key:_scaffoldKey,
        appBar: AppBar(
          title: Text("Login"),
        ),
        // bottomNavigationBar: bottomnavigation(context,1),
        // drawer: theDrawer(context),
        body:WillPopScope(
              onWillPop:()
              {
                // Navigator.pushNamed(context,'HomeScreen');
                callSnackBar("Press Exit to leave from App or Click Sign in down ",2);       
               },
          child: Container(
             margin: EdgeInsets.all(SizeConfig.blockSizeVertical*1.5),
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _loginFormKey,
              child: ListView(
                children: <Widget>[
                   Padding(
                       padding: EdgeInsets.only(bottom:SizeConfig.blockSizeVertical*1.5 ),  
                     child:TextFormField(
                    decoration: InputDecoration(
                       labelStyle:textStyle,
                        labelText: 'Email',
                        hintText: "Enter your email id eg:jp@gmail.com ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*2.5)
                            ),
                          ),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),),
                     Padding(
                       padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.5,bottom:SizeConfig.blockSizeVertical*2.5 ),
                          child:TextFormField(
                      decoration: InputDecoration(
                       labelStyle:textStyle,
                        labelText: 'Password', hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                            ),
                    controller: pwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.black,
                    onPressed: () {
                      
                      if (_loginFormKey.currentState.validate()) {
                        callSnackBar("You are logging in ..  Please wait!!!!");
                        // status._isLogin=true;
                        print("after validation");
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                            .then((currentUser) => Firestore.instance
                                .collection("users")
                                .document(currentUser.uid)
                                .get()
                                .then(
                                  (DocumentSnapshot result) =>
                                  {

                                  
                                  //
                                  Navigator.pushReplacementNamed(context, "HomeScreen"),
                                   global.Phone=currentUser.phoneNumber,
                                  global.EmailId=currentUser.email,
                                  print(global.EmailId+global.Phone),
                                  }
                                            )
                                .catchError((err) => callSnackBar(err.toString())))
                            .catchError((err) =>callSnackBar(err.toString(),1));
                      }
                       else{
                        print("no username or password wrong");
                        Text("No Username, Password ");
                        callSnackBar("No Username or wrong password");
                      }
                    },
                  ),
                   Padding(
                       padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.5,left:SizeConfig.blockSizeVertical*0.5 ),
                          child:new Text("\nOr Login with Phone Number !!\n",style:TextStyle(fontSize: 20.0,color: Colors.red)),
                              
                   ),
                   RaisedButton(
                    color:Colors.orange,
                    child: Text("Login with Phone"),
                    textColor: Colors.black,
                    onPressed: () {
                    Navigator.pushNamed(context, "PhoneLogin");
                    }
                   ),




                  Text("\nDon't have an account yet?",style:TextStyle(fontSize: 15.0,color: Colors.black)),
                  FlatButton(
                    child: Text("->  Register Here !!  <-",style:TextStyle(fontSize: 20.0,color: Colors.red, decoration: TextDecoration.underline)),
                    onPressed: () {
                      Navigator.pushNamed(context, "Register");
                    },
                  )
                ],
              ),
            )))
    );
  }
}
