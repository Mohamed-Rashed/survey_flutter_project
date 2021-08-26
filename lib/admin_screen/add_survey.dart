import 'dart:convert';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/progress_indicator.dart';
import 'package:survey/common/text_field_widget.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/finish.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

import 'admin_dashboard.dart';

class AddSurvey extends StatefulWidget {
  /*@override
  Widget build(BuildContext context) {


   return Scaffold(
     resizeToAvoidBottomInset: false,
     backgroundColor: Colors.white,
     appBar: AppBar(
       elevation: 0,
       leading: IconButton(
           icon: Icon(Icons.arrow_back, color: textColor),
           onPressed: () => {
             Get.back()}),
     ),
     body:
     Column(
         children: [
           text(c.getText("add_survey", context), 24, textColor, "assets/fonts/Janna LT Bold.ttf", context, false),
           SizedBox(height: MediaQuery.of(context).size.height*1/100,),
           Container(
             margin: EdgeInsets.only(left: 12,right: 12),
             child: text(c.getText("name_s", context), 18, textColor, "assets/fonts/Janna LT Bold.ttf", context, false),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*.5/100,),
           textField(MediaQuery.of(context).size.height*7/100,nameEditingController),
           SizedBox(height: MediaQuery.of(context).size.height*1/100,),
           Container(
             margin: EdgeInsets.only(left: 12,right: 12),
             child: text(c.getText("time_need", context), 18, textColor, "assets/fonts/Janna LT Bold.ttf", context, false),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*.5/100,),
           textField(MediaQuery.of(context).size.height*7/100,timeEditingController),
           SizedBox(height: MediaQuery.of(context).size.height*1/100,),
           Container(
             margin: EdgeInsets.only(left: 12,right: 12),
             child: text(c.getText("numer_of_point", context), 18, textColor, "assets/fonts/Janna LT Bold.ttf", context, false),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*.5/100,),
           textField(MediaQuery.of(context).size.height*7/100,pointEditingController),
           SizedBox(height: MediaQuery.of(context).size.height*1/100,),
           Container(
             margin: EdgeInsets.only(left: 12,right: 12),
             child: text(c.getText("survey_link", context), 18, textColor, "assets/fonts/Janna LT Bold.ttf", context, false),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*.5/100,),
           textField(MediaQuery.of(context).size.height*7/100,linksEditingController),
           SizedBox(height: MediaQuery.of(context).size.height*1/100,),
         //  buttonWidget(onClickAddSurveyPhoto, c.getText("attach_survey_photo", context), MediaQuery.of(context).size.height*8/100),
           SizedBox(height: MediaQuery.of(context).size.height*17/100,),
           buttonWidget(onClickAddSurveyPhoto, c.getText("upload", context), MediaQuery.of(context).size.height*8/100),
           SizedBox(height:MediaQuery.of(context).size.height*1.5/100,)

         ],
     )
   );

    }
 */

  @override
  State<StatefulWidget> createState() {
    return _AddSurveyState();
  }
}

class _AddSurveyState extends State<AddSurvey> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();
  TextEditingController pointEditingController = TextEditingController();
  TextEditingController linksEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  Controller c = new Controller();

  onClickAddSurveyPhoto() {
    if (nameEditingController.text.length == 0 &&
        timeEditingController.text.length == 0 &&
        pointEditingController.text.length == 0 &&
        linksEditingController.text.length == 0) {
      Fluttertoast.showToast(msg: "Please filled the all field");
    } else {
      // Get.off(SurveyFinish());
      saveSurveyApi(context);
    }
  }

  void saveSurveyApi(BuildContext context) {
    var pr = new ProgressDialog(context, isDismissible: true, showLogs: false);

    pr.show();
    NetworkUtil networkUtil = new NetworkUtil();
    var url = BASE_URL + ADD_SURVEY;
    var random = new Random();
    var data = {
      "surveyid": random.nextInt(100),
      "title": nameEditingController.text.toString(),
      "description": descriptionEditingController.text.toString(),
      "time": int.parse(timeEditingController.text.toString()),
      "numberofpoints": int.parse(pointEditingController.text.toString()),
      "link": linksEditingController.text.toString()
    };
    networkUtil.post(url, body: jsonEncode(data)).then((dynamic value) {
      pr.hide();
      Get.off(AdminDashboard());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
              // text(c.getText("add_survey", context), 24, textColor,
              //     "assets/fonts/Janna LT Bold.ttf", context, false),
              text(S.of(context).add_survey, 24, textColor,
                  "assets/fonts/Janna LT Bold.ttf", context, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("name_s", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).name_s, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  nameEditingController, false),
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
                height: MediaQuery.of(context).size.height * .5 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  descriptionEditingController, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("time_need", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).time_need, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  timeEditingController, true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("numer_of_point", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).numer_of_point, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  pointEditingController, true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                // child: text(c.getText("survey_link", context), 18, textColor,
                //     "assets/fonts/Janna LT Bold.ttf", context, false),
                child: text(S.of(context).survey_link, 18, textColor,
                    "assets/fonts/Janna LT Bold.ttf", context, false),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5 / 100,
              ),
              textField(MediaQuery.of(context).size.height * 7 / 100,
                  linksEditingController, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              //  buttonWidget(onClickAddSurveyPhoto, c.getText("attach_survey_photo", context), MediaQuery.of(context).size.height*8/100),
              SizedBox(
                height: MediaQuery.of(context).size.height * 12 / 100,
              ),
              // buttonWidget(onClickAddSurveyPhoto, c.getText("upload", context),
              //     MediaQuery.of(context).size.height * 8 / 100),
              buttonWidget(onClickAddSurveyPhoto, S.of(context).upload,
                  MediaQuery.of(context).size.height * 8 / 100),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1.5 / 100,
              )
            ],
          ),
        )));

  }
}
