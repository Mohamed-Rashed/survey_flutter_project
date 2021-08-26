import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/locale/AppLanguage.dart';
import 'package:survey/navscreen/account_page.dart';
import 'package:survey/navscreen/help_support.dart';
import 'package:survey/navscreen/my_point.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/screens/login.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

Widget drawerWidget(BuildContext context, Function onClick, LangProvider prlan) {
  //Controller c = new Controller();

  return Drawer(
    elevation: 8,
    child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 17 / 100),
          getDrawerItem(onClick, S.of(context).list, 1, true, context,prlan),
          getDrawerItem(onClick, S.of(context).main, 2, false, context,prlan),
          getDrawerItem(
              onClick, S.of(context).arithmetic, 3, false, context,prlan),
          getDrawerItem(
              onClick, S.of(context).my_points, 4, false, context,prlan),
          getDrawerItem(
              onClick, S.of(context).logout, 5, false, context,prlan),
          getDrawerItem(onClick, S.of(context).help, 6, false, context,prlan),
          //SizedBox(height: MediaQuery.of(context).size.width * 38 / 100),
          Image.asset(
            "assets/icons/Panel-logo--colored.png",
            width: MediaQuery.of(context).size.width * 55 / 100,
          ),
          // SizedBox(height: MediaQuery.of(context).size.width * 4 / 100),
          // InkWell(
          //     onTap: () =>
          //         {print("-----------click----"), setLanguageSelected(context)},
          //     child: Image.asset("assets/images/en_ar.png")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.updateLocale(Locale('en'));
                  Get.locale = Locale("en");
                  prlan.local = Locale("en");
                },
                child: Text('EN',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              ),
              SizedBox(width: 10,),
              Text("|",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
              SizedBox(width: 10,),
              TextButton(
                onPressed: () {
                  Get.updateLocale(Locale('ar'));
                  Get.locale = Locale("ar");
                  prlan.local = Locale("ar");
                },
                child: Text('AR',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Future<void> setLanguageSelected(BuildContext context) async {
  var appLanguage = Provider.of<AppLanguage>(context, listen: false);

  var lang = sharedPreferencesHelper.getLanguage();

  lang.then((dynamic value) {
    var langType = value;

    if (langType == "English") {
      sharedPreferencesHelper.setLanguageType("Arabic");
      appLanguage.changeLanguage(Locale("ar"));
      Fluttertoast.showToast(msg: "Language change to Arbic");
    } else {
      sharedPreferencesHelper.setLanguageType("English");
      Fluttertoast.showToast(msg: "Language change to English");
      appLanguage.changeLanguage(Locale("en"));
    }
  });

  appLanguage.changeLanguage(Locale("ar"));

/*  var prefs = await SharedPreferences.getInstance();
  var appLanguage = Provider.of<AppLanguage>(context, listen: false);
  debugPrint("-----------${prefs.getString('language_code')}");

  if (prefs.getString('language_code') == null) {
    return Null;
  }
  var code = prefs.getString('language_code');
  debugPrint("-----------$code");


  if (code == "ar") {
    Fluttertoast.showToast(msg: "Language change to English");
    appLanguage.changeLanguage(Locale("en"));
  } else {

    Fluttertoast.showToast(msg: "Language change to Arbic");
    appLanguage.changeLanguage(Locale("ar"));
  }*/
}

getDrawerItem(
    Function onClick, String name, int pos, bool isList, BuildContext context, LangProvider prlan) {
  return InkWell(
    onTap: () => {
      if (pos == 1)
        {}
      else if (pos == 2)
        {
          Get.to(Dashboard(prlan: prlan,)),
        }
      else if (pos == 3)
        {
          Get.to(AccountPage(prlan: prlan,)),
        }
      else if (pos == 4)
        {
          Get.to(PointPage(prlan: prlan,)),
        }
      else if (pos == 5)
        {sharedPreferencesHelper.setRemember(false), Get.offAll(Login())}
      else if (pos == 6)
        {
          Get.to(HelpAndSupport(prlan: prlan,)),
        },
    },
    child: isList != true
        ? Container(
            height: MediaQuery.of(context).size.width * 13 / 100,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 6, 10, 6),
            child: Row(
              children: <Widget>[
                // SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontFamily: "assets/fonts/Janna LT Bold.ttf"),
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.width * 13 / 100,
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 6, 10, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SizedBox(width: 10),
                Container(

                    // width: MediaQuery.of(context).size.width * 62 / 100,
                    // width
                    child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontFamily: "assets/fonts/Janna LT Bold.ttf"),
                )),
                InkWell(
                    onTap: () => {Get.back()},
                    child: Container(
                      child: Image.asset(
                        "assets/icons/icons8-delete-120.png",
                        cacheHeight: 24,
                        cacheWidth: 24,
                      ),
                    ))
              ],
            ),
          ),
  );
}
