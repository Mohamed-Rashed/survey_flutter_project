
import 'package:flutter/material.dart';


Widget text(String labelText, double Size, Color color, String fontFamily, BuildContext context ,bool isAlign) {
  return Container(
    width: MediaQuery.of(context).size.width*100,
    margin: EdgeInsets.only(left: 25, right: 25),
    child: Text(
      labelText,
      style: TextStyle(
        color: color,
        fontSize: Size,
        fontWeight: isAlign==true?FontWeight.bold:null,
        fontFamily: fontFamily
      ),

      textAlign:isAlign==true?TextAlign.center:null ,
    ),
  );
}