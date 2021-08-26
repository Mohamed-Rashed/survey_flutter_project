import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survey/utils/colors..dart';

Widget progressIndicatorShimmer(BuildContext context) {

  return Shimmer.fromColors(
      baseColor: white,
      highlightColor: gray,
      child: CircularPercentIndicator(
        radius: MediaQuery.of(context).size.height * 30 / 100,
        lineWidth: 10.0,
        circularStrokeCap: CircularStrokeCap.round,
        startAngle: 2.0,
        backgroundColor: Colors.black12,
        center: Text(
          "0/100",
          style: TextStyle(fontSize: 32, color: textColor),
        ),
        progressColor: yellow,
      ));
}
