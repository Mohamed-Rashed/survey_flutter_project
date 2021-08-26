import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/admin_screen/add_rewards.dart';
import 'package:survey/admin_screen/add_survey.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/screens/login.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class AdminDashboard extends StatelessWidget {
  Controller c = new Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 10 / 100,
          ),
          Center(child: c.logoColored),
          // text(c.getText("hello_admin", context), 28, textColor,
          //     "assets/fonts/Janna LT Bold.ttf", context, true),
          text(S.of(context).hello_admin, 28, textColor,
              "assets/fonts/Janna LT Bold.ttf", context, true),
          SizedBox(
            height: MediaQuery.of(context).size.height * 10 / 100,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: buttonWidget(
                  onClickAddSurvey,
                  S.of(context).add_survey,
                  MediaQuery.of(context).size.height * 8 / 100)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 4 / 100,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: buttonWidget(
                  onClickAddRewards,
                  S.of(context).add_rewards,
                  MediaQuery.of(context).size.height * 8 / 100)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 4 / 100,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 4 / 100,
          ),


          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: buttonWidget(logoutMethod, S.of(context).logout,
                  MediaQuery.of(context).size.height * 8 / 100)),

        ],
      ),
    );
  }

  onClickAddSurvey() {
    Get.to(AddSurvey());
  }

  onClickAddRewards() {
    Get.to(AddRewards());
  }



  logoutMethod() {
    sharedPreferencesHelper.setRemember(false);
    Get.offAll(Login());

  }
}
