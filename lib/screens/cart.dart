import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Arrangements/variables.dart'as global;

class Cart extends StatefulWidget
{
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  void initState(){
    print("in init state");
    super.initState();
    getCategoryList();
  }

  getCategoryList() async{
    setState(() {
      // isLoading=true;
    });
    QuerySnapshot qp;
    qp=await Firestore.instance.collection("cart").getDocuments();
    global.cart.addAll(qp.documents);
    // print(category[0].data['a']);
    print("hai at end");
  }

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
            // Text(global.cart);
             Expanded(
            child: global.cart.length == 0
                ? Center(
                    child: Text('no data'),
                 )
                  : ListView.builder(
                  // controller: _scrollController,
                  itemCount: global.cart.length,
                  itemBuilder: (context, index) {
                    return Card(child:ListTile(
                      // leading: CircleAvatar(
                      //   backgroundImage: NetworkImage(global.cart[index].data['image']!=null?global.cart[index].data['image']:null),
                      // ),
                      contentPadding: EdgeInsets.all(5),
                      title: Text(global.cart[index].data['name'],style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,)),
                      subtitle: Text(" Price  ₹ "+global.category[index].data['price']),
                      // dense: true,
                      onTap: (){
                        // Navigator.pushNamed(context,"ContactUs");
                        Navigator.pushNamed(context, "SubCategory");
                        // SubCategory(index);
                        
                        print("clicked"+global.category[index].data['a']);
                      },
                      // onLongPress: (){
                      //   //  CategoryData(index);
                      //   Navigator.pushNamed(context, "ContactForm");
                      // },
                      // onTap: (){
                      //   print("clicked"+category[index].data['a']);
                      //   // CategoryData();
                      //   // Navigator.pushNamed(context,"CategoryData");
                      //   // CategoryData(index);
                      //   Navigator.pushNamed(context,"Account");
                      //   print("clicked 2 nd tinem  "+category[index].data['a']);
                        
                      // },
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

        RaisedButton(
                  color: Color(0xFF8BC34A),
                  shape: RoundedRectangleBorder(
                    borderRadius:new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.pink)
                    ),
                  child: Text("Order Now",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 5,)
                            ),
                        
                          onPressed: (){
                            Navigator.pushNamed(context,"ContactForm");
                          }
        ),
            // Text("\n\n\n Wil be updated soon!!!",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
          ],
        ),
        ),
      )
    );
  }
}