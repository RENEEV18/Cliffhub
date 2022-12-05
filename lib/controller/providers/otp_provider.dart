import 'package:cliffhub/controller/providers/signup_provider.dart';
import 'package:cliffhub/model/otp_model/otp_model.dart';
import 'package:cliffhub/services/otp_api_service/otp_services.dart';
import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  bool isLoading = false;
  OtpServices otpServices = OtpServices();
  void sendOtp() {
    isLoading = true;
    notifyListeners();

    VerifyOtpModel verifyOtpModel =
        VerifyOtpModel(mobile: SignUpProvider().phoneNo.text);

    otpServices.sendOtp(verifyOtpModel);
    isLoading = false;
    notifyListeners();
  }
}
