import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cart extends StatefulWidget
{
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart Items"),
          backgroundColor:Colors.blue,
        ),
        bottomNavigationBar: bottomnavigation(context,2),
        drawer: theDrawer(context),
        body:WillPopScope(
          onWillPop: (){
            Navigator.pushNamed(context, 'HomeScreen');
          },
        child:Column(
          children: <Widget>[
            Text("\n\n\n Wil be updated soon!!!",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
          ],
        ),
        ),
      )
    );
  }
}