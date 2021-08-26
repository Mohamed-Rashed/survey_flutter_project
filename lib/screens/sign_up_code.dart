import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/text_editter.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/models/registrastion_data.dart';
import 'package:survey/screens/privacy.dart';
import 'package:survey/screens/sign_up_password.dart';
import 'package:survey/utils/controller.dart';

class ActivationCode extends StatelessWidget {
  TextEditingController codeController = TextEditingController();
  Controller c = Controller();
  final int code;
  final RegistrationData registrationData;

  ActivationCode({Key key, this.code, this.registrationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("------------------${c.registrationData.value.userName}");
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: c.backAsset, fit: BoxFit.cover)),
      child: Column(
        children: [
          c.marginTop35,
          c.logoWhite,
          c.marginTop25,
          // textEditter(
          //     codeController, false, c.getText("activation_code", context)),
          textEditter(
              codeController, false, S.of(context).activation_code),
          c.marginTop35,
          // _signUpWidget(context)
          // buttonWidget(onclick, c.getText("emphasis", context),
          //     MediaQuery.of(context).size.height * 8 / 100)
          buttonWidget(onclick, S.of(context).emphasis,
              MediaQuery.of(context).size.height * 8 / 100)
        ],
      ),
    ));
  }

  onclick() {
    print("---------------$code");
    print("---------------${int.parse(codeController.text.toString())}");
    print("---------------${registrationData.userName}");
    if (code == int.parse(codeController.text.toString())) {
      Get.to(PrivacyScreen(registrationData: registrationData));
    } else {
      Fluttertoast.showToast(msg: "Please enter the correct otp.");
    }
  }
}
