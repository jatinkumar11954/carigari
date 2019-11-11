import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/Data/Category.dart';
import 'package:carigari/screens/Data/contactForm.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/contactUs.dart';
import 'package:carigari/screens/privacy.dart';
import 'package:carigari/screens/splashScreen.dart';
import 'package:carigari/screens/subcategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/material.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import './showImage.dart';
import '../Arrangements/sizeModification.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  List<DocumentSnapshot> category=[];
  bool isLoading=false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  var msg;
  void callSnackBar(String me)
  {
    print("called me for scnack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 3),
      action: new SnackBarAction(
        label: "OK",onPressed: (){
          // Navigator.pushNamed(context, ;
          exit(0);
        },
      ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  @override
  void initState(){
    print("in init state");
    super.initState();
    getCategoryList();
  }

  getCategoryList() async{
    setState(() {
      isLoading=true;
    });
    QuerySnapshot qp;
    qp=await Firestore.instance.collection("category").getDocuments();
    category.addAll(qp.documents);
    // print(category[0].data['a']);
    setState(() {
      isLoading=false;
    });
  }

  // Widget CategoryData(){
  //   print("in catefory data");
  //   // CategoryData(index);
  //   return Scaffold(
  //     appBar: new AppBar(
  //       // title: Text(category[index].data['a']),
  //       title: Text("hai"),
  //     ),
  //     body: Container(
  //       child:Text("data"),
  //     ),
  //   );
  // }




  @override
  Widget build(BuildContext context)
   {
   void show() {
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
                 Navigator.of(context, rootNavigator: true).pop(true);
            //   ctxt,
            //   new MaterialPageRoute(builder: (ctxt) => new Privacy()),
            // );
            Navigator.pushNamed(context, "HomeScreen");
            // Navigator.pop(context);
              },
            ),
            new FlatButton(
              child: new Text("YES, EXIT"),
              onPressed: () {
                exit(0);
                // Navigator.of(context).pop();
              },
            ),
            
          ],
        );
      },
    );
  }

    return new Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Color(0XFF00099a9),
        title: new Text('Carigiri Furnitures'),
      ),
      drawer: theDrawer(context),
      bottomNavigationBar: bottomnavigation(context,0),
      body:WillPopScope(
      onWillPop:()
      {
        // Navigator.pushNamed(context,''),
        show();
      },
      child:Center(
        child:Column(children:<Widget>
        [

           ShowImage("logo"),
           
          
          //  Text("About\n",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
          //   InkWell(
          //           child: new Text('About Carigari Furnitures',style:TextStyle(fontSize: 20.0,color: Colors.red, decoration: TextDecoration.underline)),
          //       onTap: () async {
          //   if (await canLaunch("http://www.carigarifurniture.com//")) {
          //     await launch("http://www.carigarifurniture.com//");
          //   }
          //       }
                
          //       // launch("https://in.linkedin.com/in/jaya-prakash-veldanda-756b48179"),
          //     ),
          //  CallForcategoryDetails(),
            Text("\n\n"),
               RaisedButton(
              color: Colors.orange,
            child: Text("Subscription"),
            onPressed: ()
            {
              // show();
              Navigator.pushNamed(context, 'Testing');
              
            },
          ),
          Text("\nSelect by Category",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2,color: Colors.brown),),
          Expanded(
            child: category.length == 0
                ? Center(
                    child: Text('loading'),
                 )
                  : ListView.builder(
                  // controller: _scrollController,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return Card(child:ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(category[index].data['image']),
                      ),
                      // contentPadding: EdgeInsets.all(5),
                      title: Text(category[index].data['a']),
                      subtitle: Text("Price Starts from ₹ "+category[index].data['price']),
                      // dense: true,
                      onLongPress: (){
                        //  CategoryData(index);
                        Navigator.pushNamed(context, "ContactForm");
                      },
                      onTap: (){
                        print("clicked"+category[index].data['a']);
                        // CategoryData();
                        // Navigator.pushNamed(context,"CategoryData");
                        CategoryData(index);
                        print("clicked 2 nd tinem  "+category[index].data['a']);
                        
                      },
                      // onTap:(){
                      //   print("clicked"+category[index].data['a']);
                      //   msg=category[index].data['a'];
                      //   // SubCategory(msg
                      //   //   );

                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SubCategory(msg
                      //             )
                      //             )
                      //             );
                       
                      //   },
                      // e=category[index].data['a'],
                      // onTap: SubCategory(category[index].data['a'],index),
                      // subtitle: Text(category[index].data['short_desc']),
                    ));
                  },
                ),
        ),
        isLoading
            ? Container(
              child: Text("Loading"),
                // width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.all(5),
                // color: Colors.yellowAccent,
                // child: Text(
                //   'Loading',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              )
            : Container()

          
        //   Column(children:<Widget>
        //   [
        //     Expanded(child:category.length==0?
        //     Center(
        //       child:Text("data"),
        //     )
        //     :
        //     ListView.builder(
        //       itemCount: category.length,
        //       itemBuilder: (context,index){
        //         return ListTile(
        //           title: Text(category[index].data['a']),
        //         );
        //       },
        //     ),
        //     // isLoading?Text("Loading"):Container()
        //     ),
        //   ]
        // ),
   
        ]
        ),
      ), 
    ),
    );
   }

}




