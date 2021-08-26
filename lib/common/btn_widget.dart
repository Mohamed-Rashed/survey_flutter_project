import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey/utils/colors..dart';

Widget buttonWidget(Function onclick, String btnLable, double height) {
  Color c = yellow;
  return MaterialButton(
    onPressed: onclick,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: yellow,

    height: height,
    minWidth: 295,
    highlightColor: Colors.blue,
    child: Text(btnLable,
        style: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
  );

  /*InkWell(
    focusColor:   Colors.blueAccent,
      borderRadius: BorderRadius.circular(25),
      onTap:onclick,
      child:*/ /*ButtonTheme(
        height: height,
          buttonColor: yellow,
          child: */ /* Container(

        margin: EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
            color: yellow,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          btnLable,
          textAlign:TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
        ),
      )
  //)
  );*/
}
