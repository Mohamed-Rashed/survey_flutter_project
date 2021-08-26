import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:survey/screens/login.dart';
import 'package:survey/utils/util.dart';

class NetworkUtil {

  //static final BASE_URL = "http://13.59.146.141/api/user/";

  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url, {Map<String, String> headers, encoding}) {

    print("API Response: " +url +"======enco----$headers");

    return http
        .get(
      url,
      headers: headers,
    ).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {

        res = "{\"status\":"+
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";

        sharedPreferencesHelper.clearValue();
        Get.offAll(Login());
        throw new Exception( statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url,
      {Map<String, String> headers, body, encoding}) {
    print("-------------url----------$url----------------body---------$body");
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";

      //  sharedPreferencesHelper.clearValue();
     //   Get.offAll(Login());
        throw new Exception( statusCode);
      }
      return _decoder.convert(res);
    });
  }


  Future<dynamic> put(String url,
      {Map<String, String> headers, body, encoding}) {
    print("postBody----------------$body");
    return http
        .put(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";

        sharedPreferencesHelper.clearValue();
        Get.offAll(Login());
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }
}