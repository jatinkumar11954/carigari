
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final TextEditingController OtpEntered =new TextEditingController();
final TextEditingController MobileNumber =new TextEditingController();
bool isLogged=false;
String token="r";
var UserName="NoName";
var EmailId="No Mailid";
var Phone="";
int TempIndex;

  List<DocumentSnapshot> category=[];

  List<DocumentSnapshot> cart=[];

  //  List<DocumentSnapshot> cart=[];


  var CartData = new List<int>();
  // var CartData = new List<String>();
  // var CartPrice = new List<int>();
  int Total;
  // var<S> cart=[];

// var ReferralCode="j";
// var coins="0";


TextEditingController UserNameController =new TextEditingController();
TextEditingController EmailIdController =new TextEditingController();
TextEditingController ReferralCodeController =new TextEditingController();



abstract class Storing{
  String name;
  int price;
}

// final List<Storing> ir;
