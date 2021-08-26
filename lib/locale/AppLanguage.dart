import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey/utils/util.dart';

class AppLanguage extends ChangeNotifier {

  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      sharedPreferencesHelper.setLanguageType("English");
      print("------_appLocale----$_appLocale");
      //_appLocale = Locale('ar');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    print("----_appLocale--_appLocale----$_appLocale");
    return Null;
  }

  void  changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    print("-------fdjjdffhgjhjhjhjhj--");
    notifyListeners();
  }
}
