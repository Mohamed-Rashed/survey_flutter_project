import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:survey/utils/colors..dart';

Widget progressIndicator(String text, double d, int credit,){

  return CircularPercentIndicator(
    radius: d,
    lineWidth: 10.0,
    percent: credit/100,
    circularStrokeCap:CircularStrokeCap.round,

    startAngle: 2.0,
    backgroundColor: Colors.black12,
    center:  Text(text,style: TextStyle(
      fontSize: 32,color: textColor
    ),),
    progressColor: yellow,
  );
}