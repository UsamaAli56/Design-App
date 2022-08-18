

import 'dart:io';

import 'package:design/Model/customer_model.dart';
import 'package:dio/dio.dart';

class AuthenticationServices{

  Future<bool> createCustomer(CustomerModel model) async {
    // var authToken = base64.encode(
    //   utf8.encode(Config.key + ':' + Config.secret),
    // );
    bool ret = false;
    try {
      String url = 'http://172.16.19.120:9010/api/customer/signup';
      var response = await Dio().post(
        url,
        data: model.toJson(),
        options: Options(headers: {
          //HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      print(response.data);
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }
}