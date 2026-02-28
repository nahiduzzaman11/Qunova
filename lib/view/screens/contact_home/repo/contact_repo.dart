import 'package:flutter/material.dart';
import 'package:qunova/core/global/api_response_method.dart';
import 'package:qunova/core/global/api_response_model.dart';
import 'package:qunova/core/global/api_url.dart';
import 'package:qunova/core/service/api_service.dart';

class ContactRepo{
  ApiService apiService;
  ContactRepo({required this.apiService});

  Future<ApiResponseModel> getContactList() async{

    String uri = ApiUrl.contactList;
    debugPrint("The API URL =============== >>>>>> $uri");
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: false);
    return responseModel;
  }
}