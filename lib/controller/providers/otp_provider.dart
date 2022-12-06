import 'dart:developer';
import 'package:cliffhub/model/otp_model/otp_model.dart';
import 'package:cliffhub/services/otp_api_service/send_otp.dart';
import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  bool isLoading = false;
  OtpServices otpServices = OtpServices();
  void sendOtp(String number) {
    isLoading = true;
    notifyListeners();

    SendOtpModel sendOtpModel = SendOtpModel(mobile: number);
    log('otp send');
    otpServices.sendOtp(sendOtpModel);
    isLoading = false;
    notifyListeners();
  }
}
