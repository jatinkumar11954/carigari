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
  bool isLoading=false;
  @override
  void initState(){
    print("in init state");
    super.initState();
    getSelectedList();
  }

  // getSelectedList() async
  // {

  // }
  getSelectedList() async{
    setState(() {
      // print(global.EmailId+global.Phone);
      isLoading=true;
    });
    
    // if(global.cart.isEmpty)
    // {

    
    QuerySnapshot qp;
    qp=await Firestore.instance.collection("category").getDocuments();
    print(qp);
    print(global.selected.length);
    print("${global.touch}this is glo touch");
    int j=((global.selected.length-1>=0)&(global.touch==1))?global.selected.length-1:0;
    for(int i=j;i<global.selected.length;i++)
    {
    print(global.selected[i]);
    var te=global.selected[i];
    global.cart.add(qp.documents[te]);
    global.touch=0;
    // global.price=global.price+int.parse(global.category[i].data['price']);
    print(global.cart);

    }
    // print(global.cart);
    print("outside");

    setState(() {
      isLoading=false;
    });
    // print(category[0].data['a']);
    // print("hai at end");
    // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart Items"),
          backgroundColor: Colors.cyan[300],
        ),
        bottomNavigationBar: bottomnavigation(context,2),
        drawer: theDrawer(context),
        body:WillPopScope(
          onWillPop: (){
            Navigator.pushNamed(context, 'HomeScreen');
          },
       child:Center(
        child:Column(children:<Widget>
        [
          // children: <Widget>[
          //   // Text(global.cart);
          //   SizedBox( height: MediaQuery.of(context).size.height/25,
          // width: MediaQuery.of(context).size.width/1.5,
          // child:Text("Select by Category",style: TextStyle(
          //                   color: Colors.brown,
          //                   fontWeight: FontWeight.w600,
          //                   fontSize: SizeConfig.blockSizeVertical * 3.5,)),
          // ),
             Expanded(
            child: 
            global.cart.length == 0
                ? Center(
                    child: Text('no data'),
                 )
                  :
                   ListView.builder(
                  // controller: _scrollController,
                  itemCount: global.cart.length,
                  itemBuilder: (context, index) { print("executed j ${index}${global.cart.length}");
                    return Card(child:ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(global.cart[index].data['image']!=null?global.cart[index].data['image']:"https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new3.jpg"),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      title: Text(global.cart[index].data['a'],style: TextStyle(
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
                                   
                   ));
                  },
                ),
        ),
        isLoading?
        Container(
          child: Text("Loading"),
        ):Container(),

       global.cart.isEmpty?
       SizedBox(
         height:SizeConfig.blockSizeVertical * 6,
         width:SizeConfig.blockSizeHorizontal * 90,
                child: RaisedButton(
                   elevation:5.0,
                    color: Colors.brown[400],
                    // shape: RoundedRectangleBorder(
                    //   borderRadius:new BorderRadius.circular(18.0),
                    //   side: BorderSide(color: Colors.pink)
                    //   ),
                    child: Text("Shop Now",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeVertical * 4,)
                              ),
                          
                            onPressed: (){
                              
                              Navigator.pushNamed(context,"HomeScreen");
                            }
          ),
       )
       : SizedBox(
         height:SizeConfig.blockSizeVertical * 6,
         width:SizeConfig.blockSizeHorizontal * 90,
                child: RaisedButton(
                  elevation:5.0,
                    color: Colors.brown[400],
                    // shape: RoundedRectangleBorder(
                    //   borderRadius:new BorderRadius.circular(18.0),
                    //   side: BorderSide(color: Colors.pink)
                    //   ),
                    child: Text("Order Now",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeVertical * 4,)
                              ),
                          
                            onPressed: (){
                              
                              Navigator.pushNamed(context,"OrderConfirm");
                            }
          ),
       ),
          SizedBox(height:SizeConfig.blockSizeVertical * 2,)  // Text("\n\n\n Wil be updated soon!!!",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
          ],
        )
        ),
      )
    )
    );
  }
}