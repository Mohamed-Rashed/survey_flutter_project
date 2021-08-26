import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:progress_dialog/progress_dialog.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/text_editter.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/models/registrastion_data.dart';
import 'package:survey/models/sign_up_response.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/finish.dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

import 'login.dart';

class PasswordScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final RegistrationData registrationData;
  BuildContext context;

  ProgressDialog pr;
  PasswordScreen({Key key, this.registrationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Controller();
context=context;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
      height: MediaQuery.of(context).size.height * 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: c.backAsset, fit: BoxFit.cover)),
      child: Column(
        children: [
          c.marginTop35,
          c.logoWhite,
          c.marginTop25,
          textEditter(
              passwordController, false, S.of(context).password),
          c.marginTop35,
          textEditter(confirmPasswordController, false,
              S.of(context).password_confirmation),
          c.marginTop35,
          // _signUpWidget(context, c)
          buttonWidget(onclick, S.of(context).login,
              MediaQuery.of(context).size.height * 8 / 100)
        ],
      ),
    ));
  }

  onclick() {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter the passowrd.");
    } else if (passwordController.text.toString() !=
        confirmPasswordController.text.toString()) {
      Fluttertoast.showToast(msg: "Password des not match.");

      //   Get.to(ActivationCode());
    } else {

      pr = ProgressDialog(context, isDismissible: true, showLogs: false);
      pr.show();
      registerAPI();
    }
  }

  void registerAPI() async{


    ProgressDialog progressDialog = ProgressDialog(context);

    progressDialog.show();
    NetworkUtil networkUtil = new NetworkUtil();

    var url = BASE_URL + SIGN_UP;

    var data={
    "phone": registrationData.userPhoneNumber.toString(),
    "name": registrationData.userName.toString(),
    "email": registrationData.userEmail.toString(),
    "password": confirmPasswordController.text.toString(),
    "gender": "male"
    };
    
    networkUtil.post(url, body: jsonEncode(data)).then((dynamic value) {
      progressDialog.hide();
      var response = SignUpResponse.fromJson(value);

      if(response!=null)
        pr.hide();
        Fluttertoast.showToast(msg: "Register Successfully.");
        Get.offAll(Login());
    });
  }
}
