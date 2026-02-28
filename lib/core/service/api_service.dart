import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qunova/core/global/api_response_method.dart';
import 'package:qunova/core/global/api_response_model.dart';
import 'package:qunova/core/helper/share_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  SharedPreferences sharedPreferences;

  ApiService({required this.sharedPreferences});

  Future<ApiResponseModel> request(String uri, String method, Map<dynamic, dynamic>? params, {bool passHeader = false}) async {
    Uri url = Uri.parse(uri);
    http.Response response;

    try {
      if (method == ApiResponseMethod.getMethod) {
        if (passHeader) {
          initToken();
          response = await http.get(url, headers: {
            "Authorization" : "$tokenType $token",
            "Content-Type": "application/json",
            "Accept": "application/json",
          });
        } else {
          response = await http.get(url, headers: {
            "Authorization" : "$tokenType $token",
            "Content-Type": "application/json",
            "Accept": "application/json",
          });
        }
      } else {
        if (passHeader) {
          initToken();
          var body = jsonEncode(params);
          response = await http.post(url, body: body, headers: {
            "Authorization" : "$tokenType $token",
            "Content-Type" : "application/json",
            "Accept" : "application/json",
          });
        } else {
          response = await http.post(url, body: params, headers: {
            "Accept": "application/json",
          });
        }
      }

      debugPrint(url.toString());
      debugPrint(response.body);

      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiResponseModel(200, response.body, response.body);
      } else if (response.statusCode == 400) {
        return ApiResponseModel(400, decodedResponse['error'], response.body);
      } else if (response.statusCode == 401) {
        return ApiResponseModel(401, decodedResponse['error'], response.body);
      } else if (response.statusCode == 201) {
        return ApiResponseModel(201, decodedResponse['message'], response.body);
      } else if (response.statusCode == 499) {
        return ApiResponseModel(499, decodedResponse['error'], response.body);
      } else if (response.statusCode == 500) {
        return ApiResponseModel(500, decodedResponse['error'], response.body);
      } else if (response.statusCode == 503) {
        return ApiResponseModel(503, decodedResponse['error'], response.body);
      } else {
        return ApiResponseModel(response.statusCode, decodedResponse['message'], response.body);
      }
    } catch (e) {
      return ApiResponseModel(499, "$e".tr, '');
    }
  }

  String token = '';
  String tokenType = 'Bearer';

  void initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.token)) {
      String? t = sharedPreferences.getString(SharedPreferenceHelper.token);
      token = t ?? '';
    } else {
      token = "";
    }
  }
}
