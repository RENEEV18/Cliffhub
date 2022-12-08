import 'package:cliffhub/model/otp_model/otp_model.dart';
import 'package:cliffhub/services/otp_api_service/verify_otp.dart';
import 'package:cliffhub/view/login_screen/log_in_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class VerifyOtpProvider extends ChangeNotifier {
  VerifyOtpService verifyOtpService = VerifyOtpService();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    code = submitCode;
    notifyListeners();
  }

  void sumbitOtp(String number, BuildContext context) {
    isLoading = true;
    notifyListeners();

    SendOtpModel sendOtpModel = SendOtpModel(mobile: number);

    verifyOtpService.verifyOtp(sendOtpModel, code, context);

    isLoading = false;
    notifyListeners();
  }
}
