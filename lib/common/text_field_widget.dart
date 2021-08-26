import 'package:flutter/material.dart';
import 'package:survey/utils/colors..dart';

Widget textField(
    double height, TextEditingController controller, bool isNumber) {
  return Container(
      height: height,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 10, right: 12, left: 10, bottom: 10),
            border: InputBorder.none,
          )));
}
