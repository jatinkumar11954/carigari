import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../Arrangements/variables.dart'as global;

class SubCategory extends StatefulWidget{
  // SubCategory([int index]);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  void callSnackBar(String me)
  {
    print("called me for scnack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 1),
      // action: new SnackBarAction(
      //   label: "OK",onPressed: (){
      //     // Navigator.pushNamed(context, ;
      //     // exit(0);
      //   },
      // ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }


  @override
  Widget build(BuildContext context) {
    // void Alert(){
    //   return
    // }

    Alerting(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return new AlertDialog(
            shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0))
                 ),
          // elevation: 200.0,
          // backgroundColor: Colors.white60,
          // title: Text("Please Enter SMS Code"),
          titlePadding: EdgeInsets.all(20.0),
          content:Text(" Shop further Or Checkout",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,)),
          contentPadding: EdgeInsets.all(10.0),
          
          actions: <Widget>[
            new FlatButton(
              child: Text("Shop ",style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,)),
              onPressed: (){
                Navigator.pushNamed(context,"HomeScreen");
                
              },
            ),
             new FlatButton(
              child: Text("Checkout",style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,)),
              onPressed: (){
                  Navigator.pushNamed(context,"Cart");
              },
            )
          ],
        );
      }
    );
  }

    // TODO: implement build
    return Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Color(0XFFFFAB00),
        title: new Text(global.category[0].data['a']),
      ),
      drawer: theDrawer(context),
      bottomNavigationBar: bottomnavigation(context, 2),
      body: WillPopScope(
        onWillPop: ()
        {
          Navigator.pushNamed(context,"HomeScreen");
        },
        child: ListView(
          children: <Widget>[
            // Text(global.category[0].data['a']),
            // Text("\n"),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
              width: MediaQuery.of(context).size.width*1,
              child:Text("  Product Description for "+global.category[global.TempIndex].data['a'],style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,
                          ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width*1,
              child: Image.network(global.category[global.TempIndex].data['image']),
            ),Divider(),
            // Image.network(global.category[0].data['image']),
            Text("Price:  ₹ "+global.category[global.TempIndex].data['price'],style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,)
                            ),
              Divider(),
              SizedBox(
              
              height: MediaQuery.of(context).size.height/15,
              child: Text("Description:     .....",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,)),


              ),    
              Divider(),     
            SizedBox(
              
              height: MediaQuery.of(context).size.height/10,
              child: Center(
                child: RaisedButton(
                  color: Color(0xFF8BC34A),
                  shape: RoundedRectangleBorder(
                    borderRadius:new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.pink)
                    ),
                  child: Text("Add +",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 5,)
                            ),
                        
                          onPressed: ()async{
                            // global.
                            print("clicked "+global.category[global.TempIndex].data['a']);
                            callSnackBar("Added "+global.category[global.TempIndex].data['a'] +" to the cart");
                            // global.cart=global.category[0].data['a'];
                            // global.CartData=
                            // CallForAdding();

                             Firestore.instance
                                      .collection("cart")
                                      .document(global.category[global.TempIndex].data['a'].toString())
                                      .setData({
                                        // "name":nameInput.text,
                                        "name":global.category[global.TempIndex].data['a'].toString(),
                                        "price":global.category[global.TempIndex].data['price'].toString(),
                                        
                                      })
                                      .then((result) => {
                                        
                                      })
                                  .catchError((err) => callSnackBar("Please check the details properly"));

                            await Future.delayed(const Duration(seconds: 1));
                            Alerting(context);
                            // Navigator.pushNamed(context,"HomeScreen");
                          },
                            ),
              ),
            )
          ],
          // child: Text(global.category[0].data['a']),
        ),
      ),
    );
  }

  // void CallForAdding() {
                                  
  // }
}