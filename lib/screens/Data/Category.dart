import 'package:flutter/material.dart';

class CategoryData extends StatelessWidget
{
  
  CategoryData(index);
  @override
  Widget build(BuildContext context) {
    print("in cat");
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
         backgroundColor: Colors.cyan[300],
        title: Text("data"),
      ),
      body: Container(
        child: Text("data"),
      ),
    );
  }
  
}