// // import 'package:carigari/Arrangements/Drawer.dart';
// // import 'package:carigari/Arrangements/sizeModification.dart';
// // import 'package:carigari/screens/bottomNavigation.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';

// // class Test extends StatefulWidget
// // {
// //   @override
// //   _TestState createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   List<DocumentSnapshot> category=[];
// //   @override
// //   void initState(){
// //     super.initState();
// //     getdata();
// //   }
// //   getdata() async{
// //     QuerySnapshot qp;
    
// //     qp = await Firestore.instance
// //           .collection('products')
// //           .orderBy('name')
// //           .getDocuments();
// //     category.addAll(qp.documents);
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text("Testing"),
// //           backgroundColor:Colors.orange[300],
// //         ),
// //         bottomNavigationBar: bottomnavigation(context,1),
// //         drawer: theDrawer(context),
// //         body:StreamBuilder(
// //             // stream: qp=Firestore.instance.collection('category').getDocuments(),
// //           stream: Firestore.instance.collection('category').document('all').snapshots(),
// //           builder: (context,snapshot){
// //             if(!snapshot.hasData)return Text("load");
// //             else {
// //               return new Center(
// //                 child: ListView.builder(
// //                   itemCount: category.length,
// //                   itemBuilder:(context,index){
// //                     return ListTile(
// //                       title: Text(category[index].data['a']),
// //                       // subtitle: ,
// //                     );
                    

// //                   },
// //                 ),
// //                 // child: new Column(
// //                 //   children: <Widget>[
// //                 //     Text(snapshot.data['1']),
// //                 //     Text(snapshot.data['2']),
// //                 //   ],
// //                 // ),
// //               );
// //             }
// //           },
// //         )
// //       )
// //     );
// //   }
// // }

// import 'package:carigari/Arrangements/Drawer.dart';
// import 'package:carigari/Arrangements/sizeModification.dart';
// import 'package:carigari/screens/bottomNavigation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Test extends StatefulWidget
// {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   List<DocumentSnapshot> category=[];
//   bool isLoading = false;
//   bool hasMore = true;
//   @override
//   void initState(){
//     super.initState();
//     getdata();
//   }
//   getdata() async{
//      if (!hasMore) {
//       print('No More Products');
//       return;
//     }
//     if (isLoading) {
//       return;
//     }
//     setState(() {
//       isLoading = true;
//     });
//     QuerySnapshot qp;
    
//     qp = await Firestore.instance
//           .collection('category')
//           .getDocuments();
//     category.addAll(qp.documents);
//     print(qp);
//   }
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Testing"),
//           backgroundColor:Colors.orange[300],
//         ),
//         bottomNavigationBar: bottomnavigation(context,1),
//         drawer: theDrawer(context),
//         body: new ListView.builder(
//                   itemCount: category.length,
//                   itemBuilder:(context,index){
//                     return ListTile(
//                       title: Text(category[index].data['a']),
//                       // subtitle: ,
//                     );
//                   }
//         // body:StreamBuilder(
//         //     // stream: qp=Firestore.instance.collection('category').getDocuments(),
//         //   stream: Firestore.instance.collection('category').document('all').snapshots(),
//         //   builder: (context,snapshot){
//         //     if(!snapshot.hasData)return Text("load");
//         //     else {
//         //       return new Center(
//         //         child: ListView.builder(
//         //           itemCount: category.length,
//         //           itemBuilder:(context,index){
//         //             return ListTile(
//         //               title: Text(category[index].data['a']),
//         //               // subtitle: ,
//         //             );
                    

//         //           },
//         //         ),
//         //         // child: new Column(
//         //         //   children: <Widget>[
//         //         //     Text(snapshot.data['1']),
//         //         //     Text(snapshot.data['2']),
//         //         //   ],
//         //         // ),
//         //       );
//         //     }
//         //   },
//         // )
//       )
//     ),
//     );
//   }
// }



















 
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Firestore firestore = Firestore.instance;
  List<DocumentSnapshot> products = [];
  bool isLoading = false;
  // bool hasMore = true;
  // int documentLimit = 10;
  // DocumentSnapshot lastDocument;
  // ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getProducts();
    // _scrollController.addListener(() {
    //   double maxScroll = _scrollController.position.maxScrollExtent;
    //   double currentScroll = _scrollController.position.pixels;
    //   double delta = MediaQuery.of(context).size.height * 0.20;
    //   if (maxScroll - currentScroll <= delta) {
    //     getProducts();
    //   }
    // });
  }

  getProducts() async {
    // if (!hasMore) {
    //   print('No More Products');
    //   return;
    // }
    // if (isLoading) {
    //   return;
    // }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    
      querySnapshot = await firestore
          .collection('category')
          .orderBy('a')
          // .limit(documentLimit)
          .getDocuments();
    
    // if (querySnapshot.documents.length < documentLimit) {
    //   hasMore = false;
    // }
    // lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    products.addAll(querySnapshot.documents);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Pagination with Firestore'),
      ),
      body: Column(children: [
        Expanded(
          child: products.length == 0
              ? Center(
                  child: Text('no data'),
                )
              : ListView.builder(
                  // controller: _scrollController,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(products[index].data['a']),
                      // onTap: CustomCard(
                        
                      // ),
                      subtitle: Text(products[index].data['price']),
                    );
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
      ]),
    );
  }
}



