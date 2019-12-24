import 'package:flutter/material.dart';
import '../Arrangements/sizeModification.dart';
class ShowImage extends StatelessWidget
{
  String img;
  ShowImage(this.img);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/$img.png');
    Image image =Image(image: assetImage,
    width:  SizeConfig.blockSizeVertical * 45.0,
    height: SizeConfig.blockSizeVertical * 25.0,);
    return Container(child: image,);
  }
}
