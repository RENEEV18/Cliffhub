import 'dart:convert';
import 'dart:developer';

import 'package:cliffhub/core/api/api_baseurl.dart';
import 'package:cliffhub/core/api/api_endpoint.dart';
import 'package:cliffhub/model/otp_model/otp_model.dart';
import 'package:dio/dio.dart';

class OtpServices {
  VerifyOtpModel? otpModel;
  Dio dio = Dio();
  Future<VerifyOtpModel?> sendOtp(VerifyOtpModel model) async {
    try {
      final Response response =
          await dio.post(ApiBaseUrl().baseUrl + ApiEndpoints.sendOtp,
              data: jsonEncode(
                model.toJson(),
              ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final sendUserOtp = VerifyOtpModel.fromJson(response.data);
        log(sendUserOtp.toString());
        return sendUserOtp;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
