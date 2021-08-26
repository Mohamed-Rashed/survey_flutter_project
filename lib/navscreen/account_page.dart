import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/cloase_widget.dart';
import 'package:survey/common/nav_widget.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/models/sign_up_response.dart';
import 'package:survey/navscreen/my_point.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class AccountPage extends StatefulWidget {

  LangProvider prlan;
  AccountPage({this.prlan}) ;

  @override
  State<StatefulWidget> createState() {
    return _AccountPageState();
  }
}

class _AccountPageState extends State<AccountPage> {
  //Controller c = Controller();

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController numberEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  bool isNameEditing = false;
  bool isNumberEditing = false;
  bool isEmailEditing = false;
  bool isPasswordEditing = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      nameEditingController.text = response.name;
      numberEditingController.text = response.phone;
      emailEditingController.text = response.email;
      passwordEditingController.text = "******";
    });

    getAccountInfo();
  }

  @override
  Widget build(BuildContext context) {
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
            // text(c.getText("arithmetic", context), 20, textColor,
            //     "assets/fonts/Janna LT Bold.ttf", context, false),
                text(S.of(context).arithmetic, 20, textColor,
                "assets/fonts/Janna LT Bold.ttf", context, false),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            widgetEditTableName(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            widgetEdittableText(
                numberEditingController, isNumberEditing, false),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            widgetEditTableEmail(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            widgetEdittableText(
                passwordEditingController, isPasswordEditing, true),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            Container(
              child: buttonWidget(
                  onclickInfo,
                  S.of(context).account_info_text,
                  MediaQuery.of(context).size.height * 9 / 100),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            text(S.of(context).previous_surveys, 20, textColor,
                "assets/fonts/Janna LT Bold.ttf", context, false),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            listWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            // buttonWidget(onclickInfo, c.getText("my_points", context),
            //     MediaQuery.of(context).size.height * 6.75 / 100),
            buttonWidget(onclickInfo, S.of(context).my_points,
                MediaQuery.of(context).size.height * 6.75 / 100),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5 / 100,
            ),
            // buttonWidget(onclickInfo, c.getText("logout", context),
            //     MediaQuery.of(context).size.height * 6.75 / 100),
            buttonWidget(onclickInfo,S.of(context).logout,
                MediaQuery.of(context).size.height * 6.75 / 100),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),
          ],
        )));
  }

  onClick() {}

  closeClick() {
    Get.offAll(Dashboard());
  }

  widgetEdittableText(TextEditingController textEditingController,
      bool isEditable, bool isSecure) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
            controller: textEditingController,
            obscureText: isSecure,
            enabled: isEditable,
            decoration: InputDecoration(
              border: InputBorder.none,
            )));
  }

  widgetEdittableTextEmail(TextEditingController textEditingController,
      bool isEditable, bool isSecure) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: textEditingController,
          enabled: isEmailEditing,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () => {
                        setState(() {
                          print("-------------------------");
                          isEmailEditing = !isEmailEditing;
                          print("---------$isEmailEditing");
                        }),
                      },
                  icon: isEmailEditing == false
                      ? Image.asset("assets/icons/icons8-edit-480.png",
                          cacheWidth: 28, cacheHeight: 28)
                      : Icon(Icons.done))),
        ));
  }

  widgetEditTableName() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextField(
              controller: nameEditingController,
              enabled: isNameEditing,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 15 / 100,
            child: IconButton(
              onPressed: () => {
                setState(() {
                  if (isNameEditing) {
                    Fluttertoast.showToast(msg: "Profile name updated");
                    updateUSerInfo();
                  }

                  isNameEditing = !isNameEditing;
                }),
              },
              icon: isNameEditing == false
                  ? Image.asset("assets/icons/icons8-edit-480.png",
                      cacheWidth: 28, cacheHeight: 28)
                  : Icon(Icons.done),
            ),
          ),
        ],
      ),
    );
  }

  widgetEditTableEmail() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextField(
              controller: emailEditingController,
              enabled: isEmailEditing,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 15 / 100,
            child: IconButton(
              onPressed: () => {
                setState(() {
                  if (isEmailEditing) {
                    Fluttertoast.showToast(msg: "Profile email updated.");

                    updateUSerInfo();
                  }
                  isEmailEditing = !isEmailEditing;
                }),
              },
              icon: isEmailEditing == false
                  ? Image.asset("assets/icons/icons8-edit-480.png",
                      cacheWidth: 28, cacheHeight: 28)
                  : Icon(Icons.done),
            ),
          ),
        ],
      ),
    );
  }

  listWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 22 / 100,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              height: MediaQuery.of(context).size.height * 10 / 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/img.png",
                      cacheHeight: 55,
                      width: 70,
                    ),
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 100,
                                  child: text(
                                      "استبيان العناية بالشعر",
                                      12,
                                      textColor,
                                      "assets/fonts/Janna LT Regular.ttf",
                                      context,
                                      false)),
                              Container(
                                child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width *
                                      60 /
                                      100,
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  backgroundColor: Colors.grey,
                                  progressColor: yellow,
                                  center: Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ),
                              text(
                                  "* 7 star  ",
                                  12,
                                  textColor,
                                  "assets/fonts/Janna LT Regular.ttf",
                                  context,
                                  false)
                            ],
                          ))),
                ],
              ),
            );
          }),
    );
  }

  onclickInfo() {
    Get.off(new PointPage());
  }

  void getAccountInfo() {
    NetworkUtil networkUtil = new NetworkUtil();
    var url = BASE_URL + ACCOUNT_PAGE;

    networkUtil
        .get(url, headers: {"Authorization": "$TOKEN_PRE" + "$token"}).then(
            (dynamic value) {
      setState(() {

        response = SignUpResponse.fromJson(value);

        if (response != null) {
          print("----------$response");

          setState(() {

            nameEditingController.text = response.name;
            numberEditingController.text = response.phone;
            emailEditingController.text = response.email;
            //passwordEditingController.text = ;
          });
        }
      });
    });
  }

  void updateUSerInfo() {
    var pr = new ProgressDialog(context, isDismissible: true, showLogs: false);

    pr.show();
    NetworkUtil networkUtil = new NetworkUtil();

    var url = BASE_URL + "/user/${numberEditingController.text}";

    var data = {
      "name": nameEditingController.text,
      "email": emailEditingController.text.length == 0
          ? ""
          : emailEditingController.text
    };
    networkUtil.put(url,
        body: jsonEncode(data),
        headers: {"Authorization": "$TOKEN_PRE" + "$token"}).then((value) {
      pr.hide();
      setState(() {
        response = SignUpResponse.fromJson(value);
      });
      getAccountInfo();
    });
  }
}
