import 'dart:async';
import 'dart:io';
import 'package:carigari/screens/Data/ProfileEdit.dart';
import 'package:carigari/screens/Data/about.dart';
import 'package:carigari/screens/Data/details.dart';
import 'package:carigari/screens/Data/notification.dart' as prefix0;
import 'package:carigari/screens/subcategory.dart';
import 'package:carigari/screens/testforcategory.dart';
import 'package:connectivity/connectivity.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/Screens/contactUS.dart';
import 'package:carigari/screens/Data/Account.dart';
import 'package:carigari/screens/Data/contactForm.dart';
import 'package:carigari/screens/Data/login.dart';
import 'package:carigari/screens/Data/phone.dart';
import 'package:carigari/screens/Data/subscription.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/cart.dart';
import 'package:carigari/screens/help.dart';
import 'package:carigari/screens/logout.dart';
import 'package:carigari/screens/Data/notification.dart';
import 'package:carigari/screens/privacy.dart';
import 'package:carigari/screens/showImage.dart';
// import 'package:carigari/screens/test.dart';
import './Data/CheckingData.dart';
import './splashScreen.dart';
import 'package:flutter/material.dart';
import './homescreen.dart';
import './imageNoNet.dart';
import './selectScreen.dart';
import './Data/Register.dart';
import '../screens/orderConfirm.dart';
class IsConnection extends StatefulWidget {
  @override
  _IsConnection createState() => _IsConnection();
}

class _IsConnection extends State<IsConnection> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context)
  {
    if (_source.keys.toList()[0] == ConnectivityResult.none)
     {
      print("noooo");
      return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: new AppBar(
          title: new Text("Carigari Furnitures"),
        ),
        body: WillPopScope(
        //Wrap out body with a `WillPopScope` widget that handles when a user is cosing current route
        onWillPop: () {
          exit(0);
        },
        child:Center(
          child: Column(
            children: <Widget>[
            Text("\n\tNo Internet!! Please connect and \ntry again with proper Network.",textDirection: TextDirection.ltr,style:TextStyle(fontSize:20.0,color: Colors.red),),
              ShowImageWhenNoInternet("noInternet"), 
          RaisedButton(
             child: Text("Retry"),
             color: Colors.green,
             onPressed: ()
             {
              //  IsConnection();
              Splash();
             },
                 ),
              ]
              )
              ),
              ),
              ),
);

     
     }
    else{
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Splash(),
        routes: <String, WidgetBuilder>{
          'Splash':(BuildContext context)=> new Splash(),
          'IsConnection':(BuildContext context)=> new IsConnection(),
         'HomeScreen': (BuildContext context) => new HomeScreen(),
        'CheckData': (BuildContext context) => new CheckData(),
        'ScreenSelection':(BuildContext context) => new SelectScreen(),
        'Register':(BuildContext context) => new Register(),
        // 'Details':(BuildContext context)=> new Details(),
        'ContactForm':(BuildContext context) => new ContactForm(),
        // 'BottomNavigation':(BuildContext context) => new BottomNavigation(),
        // 'SignIn':(BuildContext context) => new SignIn(),
        'ContactUs':(BuildContext context) => new ContactUs(),
        // 'Test':(BuildContext context) => new Test(),
        'Cart':(BuildContext context) => new Cart(),
        'AccountInfo':(BuildContext context) => new AccountInfo(),
        'Help':(BuildContext context) => new Help(),
        'Privacy':(BuildContext context) => new Privacy(),
        'Subscription':(BuildContext context)=> new Subscription(),
        'Notification':(BuildContext context)=> new prefix0.Notification(),
        'Login': (BuildContext context) => new LoginPage(),
        'PhoneLogin':(BuildContext context)=> new PhoneLogin(),
        'Logout': (BuildContext context) => new Logout(),
        'Testing':(BuildContext context) => new Test(),
        'About':(BuildContext context)=> new About(),
        'ProfileEdit':(BuildContext context) => new ProfileEdit(),
        'SubCategory':(BuildContext context) => new SubCategory(),
        
        'OrderConfirm':(BuildContext context) => new OrderConfirm(),


    },
  );
    }
    
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}



class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
