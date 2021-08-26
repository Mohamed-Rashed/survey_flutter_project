import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {

  final String  userEmail="email";
  final String  email="changeEmail";
  final String  userPassword="password";
final String isRemember="isRemember";
final String isAdmin="isAdmin";
final String userToken="userToken";

final String setLanguage="setLanguage";


  Future<String> getChangeP() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(email) ?? '';
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userEmail) ?? '';
  }
  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(setLanguage) ?? '';
  }
  Future<String> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userPassword) ?? "";
  }
  Future<bool> isRememberValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(isRemember) ?? false;
  }
  Future<bool> isAdminValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(isAdmin) ?? false;
  }

  Future<bool> setEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userEmail, value);
  }
  Future<bool> setLanguageType(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(setLanguage, value);
  }

  Future<bool> setChangeP(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(email, value);
  }
 Future<bool> setPassword(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userPassword, value);
  }
  Future<bool> setRemember(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(isRemember, value);
  }

  Future<bool> setAdmin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isAdmin, value);
  }

Future<void> clearValue() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
  Future<bool> setUserToeken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userToken, value);
  }

  Future<String>  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userToken) ?? "";
  }

}