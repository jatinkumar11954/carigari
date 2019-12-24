import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';


final databaseReference = FirebaseDatabase.instance.reference();


class CheckData extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckData();
      }
      
}

class _CheckData extends State<CheckData>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.cyan[300],title: Text("Carigiri Furnitures"),),
        body:WillPopScope(
          onWillPop: (){
            //write smtg
          },
          child:Center(
            child:Column(
              children: <Widget>[
            FlatButton(
              child: Text(
                "Create New Data"
              ),
              color: Colors.green,
              onPressed:(){ CreateData();},
            ),
            FlatButton(
              child: Text(
                "Retrieve Data"
              ),
              color: Colors.green,
              onPressed: RetrieveData(),
            ),
            FlatButton(
              child: Text(
                "Update Data"
              ),
              color: Colors.green,
              onPressed: UpdateData(),
              ),
              FlatButton(
              child: Text(
                "Delete Data"
              ),
              color: Colors.green,
              onPressed: DeleteData(),
            ),
                        ],
                      ),
                    ),
                  ),

      ),
      );
  }
              
               void CreateData(){
                 
    databaseReference.child("123").set({
    'title': 'Mastering EJB',
    'description': 'Programming Guide for J2EE'
  });
                  
                }
              
                UpdateData() {}

                 RetrieveData() {}

                DeleteData() {}


}
    