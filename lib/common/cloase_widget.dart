


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey/utils/colors..dart';

Widget closeWidget( Function  onClick){


  return Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: GestureDetector(
        onTap:onClick,
        child: Image.asset("assets/icons/icons8-delete-120.png",width: 28,),

      )
  );


}