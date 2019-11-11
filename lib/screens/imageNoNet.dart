import 'package:flutter/material.dart';
class ShowImageWhenNoInternet extends StatelessWidget
{
  String img;
  ShowImageWhenNoInternet(this.img);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/$img.png');
    Image image =Image(image: assetImage,
    width: 1000.0,
    height:150.0,
    );
    return Container(child: image,);
  }
}
