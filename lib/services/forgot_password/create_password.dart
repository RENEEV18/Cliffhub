import 'dart:developer';

import 'package:cliffhub/core/api/api_baseurl.dart';
import 'package:cliffhub/core/api/api_endpoint.dart';
import 'package:cliffhub/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CreatePasswordService {
  Dio dio = Dio();

  Future<String?> createPassword(
      String emailId, String password, BuildContext context) async {
    try {
      final Response response = await dio
          .post(ApiBaseUrl().baseUrl + ApiEndpoints.newPassword, data: {
        "emailId": emailId,
        "password": password,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(
          response.data.toString(),
        );
        return response.data;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
