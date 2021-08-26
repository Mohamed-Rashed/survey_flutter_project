import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:survey/admin_screen/admin_dashboard.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/text_field_widget.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/finish.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class AddRewards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddRewardsState();
  }
}

class _AddRewardsState extends State<AddRewards> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController pointOfWorthEditingController = TextEditingController();
  TextEditingController codeRedeemEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  Controller c = new Controller();

  onClickAddSurveyPhoto() {}

  onClickUpload() {
    if (descriptionEditingController.text.length == 0 &&
        titleEditingController.text.length == 0 &&
        pointOfWorthEditingController.text.length == 0 &&
        codeRedeemEditingController.text == 0) {
      Fluttertoast.showToast(msg: "Please filled the all field");
    } else {
      addAwardsSurvey();

      //  Get.off(SurveyFinish());
    }
  }

  void addAwardsSurvey() {
    var pr = new ProgressDialog(context, isDismissible: true, showLogs: false);

    pr.show();
    NetworkUtil networkUtil = new NetworkUtil();
    var url = BASE_URL + GET_AWARDS;
    //  var random = new Random();

    var data = {
      "title": titleEditingController.text.toString(),
      "description": descriptionEditingController.text.toString(),
      "code": codeRedeemEditingController.text.toString(),
      "correspondingnumberofpoints":
          int.parse(pointOfWorthEditingController.text.toString())
    };
    networkUtil.post(url, body: jsonEncode(data)).then((value) {
      pr.hide();
      Get.off(AdminDashboard());
      print("--------------$value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () => {Get.back()}),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // text(c.getText("attach_reward_photo", context), 28, textColor,
              //     "assets/fonts/Janna LT Bold.ttf", context, false),
              text(S.of(context).attach_reward_photo, 28, textColor,
                  "assets/fonts/Janna LT Bold.ttf", context, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("title", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).title, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  titleEditingController, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("description", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).description, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  descriptionEditingController, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("points_worth", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).points_worth, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  pointOfWorthEditingController, true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("redeem_code", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).redeem_code, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  codeRedeemEditingController, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              /*   buttonWidget(
                  onClickAddSurveyPhoto,
                  c.getText("attach_survey_photo", context),
                  MediaQuery.of(context).size.height * 8 / 100),
            SizedBox(
                height: MediaQuery.of(context).size.height * 19 / 100,
            ),*/
              // buttonWidget(onClickUpload, c.getText("upload", context),
              //     MediaQuery.of(context).size.height * 8 / 100),
              buttonWidget(onClickUpload, S.of(context).upload,
                  MediaQuery.of(context).size.height * 8 / 100),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
