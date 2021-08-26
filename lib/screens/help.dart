import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/screens/privacy.dart';
import 'package:survey/utils/controller.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Controller();

    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height * 100,
            width: MediaQuery.of(context).size.width * 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: c.backAsset, fit: BoxFit.cover)),
            child: Column(
              children: [
                c.marginTop35,
                c.marginTop25,
                Center(
                  //child: text(c.getText("thanks", context), 30),
                  child: text(S.of(context).thanks, 30),
                ),
                c.marginTop35,
                Center(
                  child: c.logoCheck,
                ),
                c.marginTop35,
                Center(
                  //child: text(c.getText("help_text", context), 20),
                  child: text(S.of(context).help_text, 20),
                ),
                c.marginTop35,
                buttonWidget(_onClick, S.of(context).end, 50)
              ],
            )));
  }

  _onClick() {
    Get.offAll(Dashboard());
    print("---------------------");
  }

  Widget text(String labelText, double Size) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: Text(
        labelText,
        style: TextStyle(
          color: Colors.white,
          fontSize: Size,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
