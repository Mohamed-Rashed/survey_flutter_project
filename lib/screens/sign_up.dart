import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/text_editter.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/models/otp_response.dart';
import 'package:survey/models/registrastion_data.dart';
import 'package:survey/network/network_util.dart';
import 'package:survey/screens/sign_up_code.dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class SignUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nominationNumberController = TextEditingController();
  Controller c = Controller();
  RegistrationData registrationData;

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
                c.marginTop25,
                textEditter(nameController, false, S.of(context).name),
                c.marginTop35,
                textEditter(
                    emailController, false, S.of(context).email),
                c.marginTop35,
                textEditter(numberController, false,
                    S.of(context).require_number
                ),
                c.marginTop35,
                textEditter(nominationNumberController, false,
                    S.of(context).nominate_number),
                c.marginTop35,
                // _signUpWidget(context)
                buttonWidget(onclick, S.of(context).activation, 50)
              ],
            ),
          )),
    );
  }

  onclick() {
    if (nameController.text.isEmpty || numberController.text.isEmpty ) {
      Fluttertoast.showToast(msg: "Please fill all Field.");
    } else {
      registrationData = RegistrationData(
              userName: nameController.text,
              userEmail: emailController.text,
              userPhoneNumber: numberController.text,
              userReferenceNumber: nominationNumberController.text)
          ;

      callSendOtpApi();
      //   Get.to(ActivationCode());
    }
  }

  void callSendOtpApi() {
    NetworkUtil networkUtil = NetworkUtil();

    var url = BASE_URL + SEND_OTP+"?user_phone_input=%2B2${numberController.text.toString()}";

   // var dataw = {"user_phone_input": numberController.text.toString()};

    networkUtil.post(url).then((dynamic value) {
      print("-------otp------${value}");
      var response= OtpResponse.fromJson(value);


      if(response.success){
        Get.to(ActivationCode(code:response.otp,registrationData:registrationData));
      }else{
        Fluttertoast.showToast(msg: "Server Issue.");
      }
      //Get.to(ActivationCode());


      print("-------otp------${response.otp}");

    });
  }
}
