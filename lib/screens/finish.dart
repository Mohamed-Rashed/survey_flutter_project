import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:survey/admin_screen/admin_dashboard.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/screens/help.dart';
import 'package:survey/utils/controller.dart';

class SurveyFinish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Controller();

    return WillPopScope(
      onWillPop: ()=> _onClick(),
      child: Scaffold(
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
                    //child: text(c.getText("sports_questionnaire", context), 30),
                    child: text(S.of(context).sports_questionnaire, 30),
                  ),
                  c.marginTop35,
                  Center(
                    child: c.logoCheck,
                  ),
                  c.marginTop35,
                  Center(
                    //child: text(c.getText("thanks_text", context), 20),
                    child: text(S.of(context).thanks_text, 20),
                  ),
                  c.marginTop35,
                  buttonWidget(_onClick, S.of(context).end,50)
                ],
              ))),
    );
  }

  Widget text(String labelText, double Size) {
    return Center(
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

  _onClick() {
    Get.offAll(Dashboard());

  }
}
