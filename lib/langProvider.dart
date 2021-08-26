

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangProvider extends ChangeNotifier{

  _saveInPrefrence(String languageCode) async {
    print("here1");
    print("kkkkk ${languageCode}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language_cade", languageCode);
    getPrefrence();

  }

  getPrefrence() async {
    print("here2");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    code = prefs.getString("language_cade");
    print("lllllcode ${code}");
    if (code == null) {
      code = "en";
      notifyListeners();
    }
    Get.updateLocale(Locale(code));
    Get.locale = Locale(code);
    notifyListeners();
  }

  Locale _local = Locale("en");
  String code = "en";

  Locale get local => _local;

  set local(Locale value) {
    _local = value;
    _saveInPrefrence(value.languageCode);
    notifyListeners();
  }
}