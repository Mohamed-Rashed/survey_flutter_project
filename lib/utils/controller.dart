import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:survey/locale/app_localizations.dart';
import 'package:survey/models/registrastion_data.dart';

class Controller extends GetxController {
  var count = 0;

var registrationData= RegistrationData().obs;

  void increment() {
    count++;
    update();
  }

  Widget back = Image.asset(
    "assets/images/background.png",
    fit: BoxFit.cover,
  );

  AssetImage backAsset = AssetImage("assets/images/background.png");

  Widget logoWhite = Image.asset("assets/icons/Panel-logo-white.png");

  Widget logoColored = Image.asset("assets/icons/Panel-logo--colored.png");

  Widget logoCheck = Image.asset("assets/icons/verified.png",width: 250,);

  Widget marginTop35 = SizedBox(height: 35);
  Widget marginTop25 = SizedBox(height: 25);
  Widget marginTop20 = SizedBox(height: 20);
  Widget marginTop10 = SizedBox(height: 10);
  Widget marginTop5 = SizedBox(height: 5);
  Widget marginTop15 = SizedBox(height: 15);

/*  Widget textRegister = Center(
      child: Text(
    getText("content", context),
    style: TextStyle(fontSize: 18, color: Color(0xff20268A)),
  ));*/

  // String getText(String content, BuildContext context) {
  //   return AppLocalizations.of(context).translate(content);
  // }

  // getAllSurvey() {
  //
  // }

  @override
  void onInit() {
    print("GlobalController - onInit");
    //getAllSurvey();
    super.onInit();
  }
}
