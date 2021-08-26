import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/utils/colors..dart';

class HelpAndSupportController extends GetxController {
  Widget marginTop35 = SizedBox(height: 35);
  Widget marginTop25 = SizedBox(height: 25);

  Widget textField(double height,TextEditingController controller) {


    return Container(
      height: height,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        controller: controller,
      decoration: InputDecoration(
    contentPadding: EdgeInsets.only(
    top: 15, right: 12, left: 10, bottom: 10),
    border: InputBorder.none,
  )
      )    );
  }
}
