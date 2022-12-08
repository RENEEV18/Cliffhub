import 'dart:convert';
import 'dart:developer';
import 'package:cliffhub/core/api/api_baseurl.dart';
import 'package:cliffhub/core/api/api_endpoint.dart';
import 'package:cliffhub/model/login_model/login_model.dart';
import 'package:cliffhub/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoginServices {
  Dio dio = Dio();
  LoginModel? loginModel;
  Future<LoginModel?> loginUser(LoginModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        loginModel = LoginModel.fromJson(response.data);
        log(response.data.toString());

        return loginModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
 
 
 
 
  // Future<void> signIn(String name, String password) async {
  //   String apiUrl = '$baseUrl/sign-in';
  //   try {
  //     final Response response =
  //         await dio.post(apiUrl, data: {'name': name, 'password': password});
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // final data = jsonDecode(response.data.toString());
  //       log(response.data.toString());
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //   }
  // }