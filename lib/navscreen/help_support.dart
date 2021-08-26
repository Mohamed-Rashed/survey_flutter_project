import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/cloase_widget.dart';
import 'package:survey/common/nav_widget.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/controllers/help_support_controller.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/help.dart';
import 'package:survey/screens/privacy.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class HelpAndSupport extends StatefulWidget {

  LangProvider prlan;
  HelpAndSupport({this.prlan}) ;


  @override
  State<StatefulWidget> createState() {
    return _HelpAndSupportState();
  }
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  HelpAndSupportController helpAndSupportController =
      HelpAndSupportController();
  Controller c = Controller();

  TextEditingController nameController = TextEditingController();
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        actions: [closeWidget(closeClick)],
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => {
                Scaffold.of(context).openDrawer(),
              },
              child: Image.asset(
                "assets/images/drawer_icon.png",
                cacheWidth: 24,
                cacheHeight: 22,
              ),
            );
          },
        ),
      ),
      drawer: drawerWidget(context, onClick,widget.prlan),
      body: SingleChildScrollView(
        child: Column(
          children: [
            c.marginTop10,
            // text(c.getText("help", context), 24, textColor,
            //     "assets/fonts/Janna LT Bold.ttf", context, false),
            text(S.of(context).help, 24, textColor,
                "assets/fonts/Janna LT Bold.ttf", context, false),
            c.marginTop15,
            text(S.of(context).email_us, 20, textColor,
                "assets/fonts/Janna LT Regular.ttf", context, false),
            text("shereen.a@marketeersresearch.com", 19, textColor,
                "assets/fonts/Janna LT Regular.ttf", context, false),
            c.marginTop15,
            text(S.of(context).name, 22, textColor,
                "assets/fonts/Janna LT  Bold.ttf", context, false),
            SizedBox(
              height: 10,
            ),
            helpAndSupportController.textField(
                MediaQuery.of(context).size.height * 8 / 100, nameController),
            SizedBox(
              height: 10,
            ),
            text(S.of(context).your_inquiry, 22, textColor,
                "assets/fonts/Janna LT  Bold.ttf", context, false),
            SizedBox(
              height: 10,
            ),
            helpAndSupportController.textField(
                MediaQuery.of(context).size.height * 35 / 100, queryController),
            c.marginTop15,
            buttonWidget(onClick, S.of(context).send,
                MediaQuery.of(context).size.height * 8 / 100),
            c.marginTop15,
          ],
        ),
      ),
    );
  }

  onClick() {
    if (nameController.text.isEmpty || queryController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all Field.");
    } else {
      if (response.email != null) {
        sendQueryApi();
        Get.to(HelpScreen());
      } else {
        Fluttertoast.showToast(msg: "Email is not register with user.");
      }
    }

//    Get.to(PrivacyScreen());
  }

  closeClick() {
    Get.back();
  }

  void sendQueryApi() {
    NetworkUtil networkUtil = new NetworkUtil();

    var url = BASE_URL +
        SEND_QUERY +
        "?name=${nameController.text.toString()}&msg=${queryController.text.toString()}";
    var data = {
      "name": nameController.text.toString(),
      "msg": queryController.text.toString()
    };
    networkUtil.post(url, headers: {
      "Authorization": "$TOKEN_PRE" + token
    }).then((dynamic value) {});
  }
}
