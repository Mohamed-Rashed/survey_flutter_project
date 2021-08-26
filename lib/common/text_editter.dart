import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:survey/utils/colors..dart';

Widget textEditter(
    TextEditingController textEditingController, bool isPassword, labelText) {
  return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: TextField(

        controller: textEditingController,
        obscureText: isPassword,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 16, color: textColor,backgroundColor:white,),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green

            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.remove_red_eye),
                  )
                : null,
            labelText: labelText,
            contentPadding: EdgeInsets.only(left: 10, right: 10)),
      ));
}



Widget textEditterPassword(
    TextEditingController textEditingController, bool isPassword, labelText, Function onSecureClick,bool isSecureConfirmPassword) {
  return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: TextField(

        controller: textEditingController,
        obscureText: isSecureConfirmPassword,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 16, color: textColor,backgroundColor:white,),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green

            suffixIcon:  IconButton(
              onPressed: onSecureClick,
              icon: Icon(Icons.remove_red_eye),
            ),
            labelText: labelText,
            contentPadding: EdgeInsets.only(left: 10, right: 10)),
      ));
}


