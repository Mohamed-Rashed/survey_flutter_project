import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:survey/admin_screen/admin_dashboard.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/screens/login.dart';
import 'package:survey/screens/privacy.dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

class SplashScreen extends StatefulWidget {
  LangProvider prlan;
  SplashScreen({this.prlan});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget svg = SvgPicture.asset("assets/images/logow.svg");

  Timer _timer;
  @override
  void initState() {
    widget.prlan.getPrefrence();
    _moveToLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: GetBuilder<Controller>(
            builder: (anything) => Stack(
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: controller.back),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: controller.logoWhite)
                  ],
                )
        )
    );
  }

  _moveToLogin(BuildContext context) {
    var isLogin=false;
    var isAdminTrue=false;
    var isRemember=sharedPreferencesHelper.isRememberValue();
    var userToken =sharedPreferencesHelper.getToken();
    var isAdmin= sharedPreferencesHelper.isAdminValue();

    isRemember.then((dynamic value) {


      isLogin= value;

      if(isLogin){
        userToken.then((value) {
          token= value;
        });
      }

    });
    isAdmin.then((dynamic value) {
      isAdminTrue=value;

    });

    _timer = new Timer(const Duration(seconds: 1), () {
      Get.offAll(isLogin==false?Login():(isAdminTrue?AdminDashboard():Dashboard(prlan: widget.prlan,)));
     // Get.offAll(isLogin==false?PrivacyScreen():(isAdminTrue?AdminDashboard():Dashboard()));

    });
  }
}
