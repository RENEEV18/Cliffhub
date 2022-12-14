import 'dart:convert';
import 'dart:developer';
import 'package:cliffhub/core/api/api_baseurl.dart';
import 'package:cliffhub/core/api/api_endpoint.dart';
import 'package:cliffhub/model/sign_up_model/sign_up_model.dart';
import 'package:cliffhub/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SignupServices {
  Dio dio = Dio();

  Future<SignupModel?> signupUser(
      SignupModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signUp,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final signupResponse = SignupModel.fromJson(response.data);
        log(response.data.toString());
        return signupResponse;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
