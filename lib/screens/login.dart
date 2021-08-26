import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'package:survey/admin_screen/admin_dashboard.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/text_editter.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/models/login_response.dart';
import 'package:survey/models/sign_up_response.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/screens/sign_up.dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  bool isSecureConfirmPassword = true;
  TextEditingController numberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Controller c = new Controller();

  ProgressDialog pr;

  onSecureClick() {
    print("-------------$isSecureConfirmPassword");
    if (isSecureConfirmPassword) {
      setState(() {
        isSecureConfirmPassword = false;
      });
    } else {
      setState(() {
        isSecureConfirmPassword = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: c.backAsset, fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            c.marginTop35,
            c.logoWhite,
            c.marginTop35,
            textEditter(numberController, false,
                S.of(context).telephone_number),
            c.marginTop35,

            textEditterPassword(
                passwordController,
                true,
                S.of(context).password,
                onSecureClick,
                isSecureConfirmPassword),

            c.marginTop35,

            buttonWidget(onclick, S.of(context).login, 50),
            //_loginWidget(context),
            c.marginTop35,

            InkWell(
              onTap: () => {
                Get.to(SignUp())
              },
              child: Center(
                  child: Text(
                    S.of(context).register_here,
                style: TextStyle(fontSize: 18, color: Color(0xff20268A)),
              )),
            )
          ],
        ),
      ),
    ));
  }

  onclick() {
    if (numberController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all Field.");
    } else {
      /*  c.registrationData = RegistrationData(
          userName: nameController.text,
          userEmail: emailController.text,
          userPhoneNumber: numberController.text,
          userReferenceNumber: nominationNumberController.text)
          .obs;*/
      pr = ProgressDialog(context, isDismissible: true, showLogs: false);
      pr.show();
      callLoginApi();
      //   Get.to(ActivationCode());
    }
  }

  Future<void> callLoginApi() async {
    //  ProgressDialog progressDialog = ProgressDialog(context);

    // progressDialog.show();
/*<<<<<<< HEAD
    var pr=  ProgressDialog(context,isDismissible: true,showLogs: false);
=======
    var pr = new ProgressDialog(context, isDismissible: true, showLogs: false);
>>>>>>> 2e20adb6b63c0e8579f60f9aed788399f4e6707f*/

    // await pr.show();

    NetworkUtil networkUtil = NetworkUtil();

    var url = BASE_URL + LOGIN;

    //var data=

    networkUtil.post(url, body: {
      "username": "${numberController.text.toString()}",
      "password": passwordController.text.toString()
    }).then((dynamic value) {
      //  progressDialog.hide();
      pr.hide();
      var res = LoginResponse.fromJson(value);

      if (res.accessToken != null) {
        token = res.accessToken;
        sharedPreferencesHelper.setUserToeken(token);
        sharedPreferencesHelper.setRemember(true);

        getUserInfo();
      }
    });
  }

  void getUserInfo() {
    NetworkUtil networkUtil = new NetworkUtil();
    var url = BASE_URL + ACCOUNT_PAGE;

    networkUtil
        .get(url, headers: {"Authorization": "$TOKEN_PRE" + "$token"}).then(
            (dynamic value) {
      setState(() {
        response = SignUpResponse.fromJson(value);

        if (response != null) {
          if (response.isAdmin == "True") {

            sharedPreferencesHelper.setAdmin(true);
            Get.offAll(AdminDashboard());
          } else {
            sharedPreferencesHelper.setAdmin(false);
            Get.offAll(Dashboard());
          }
          //  Get.offAll(Dashboard());

        }
      });
    });
  }
}
