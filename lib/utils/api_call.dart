
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:survey/utils/util.dart';

class ApiCall{

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final fullUrl = BASE_URL + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");


    final response = await http.get(fullUrl);

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> post(String partUrl, String body) async {
    final fullUrl = BASE_URL + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");

    final response = await http.post(Uri.parse(fullUrl),body: jsonEncode(body));

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }
  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body ?? "";
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }




}