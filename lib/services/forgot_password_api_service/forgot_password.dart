import 'dart:developer';

import 'package:cliffhub/core/api/api_baseurl.dart';
import 'package:cliffhub/core/api/api_endpoint.dart';
import 'package:cliffhub/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordService {
  Dio dio = Dio();
  Future<String?> forgotPassword(String name, BuildContext context) async {
    try {
      final Response response = await dio.post(
          ApiBaseUrl().baseUrl + ApiEndpoints.forgotPassword,
          data: {"name": name});
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
