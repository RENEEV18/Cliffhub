import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/model/sign_up_model/sign_up_model.dart';
import 'package:cliffhub/services/signup_api_service/signup_services.dart';
import 'package:cliffhub/view/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  SignupServices signupServices = SignupServices();
  bool isLoading = false;
  Future<void> registerUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final signupUser = SignupModel(
      firstName: firstName.text,
      lastName: lastName.text,
      userName: username.text,
      emailId: emailId.text,
      mobile: phoneNo.text,
      password: password.text,
    );

    signupServices.signupUser(signupUser, context).then(
      (value) {
        if (value != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const OtpScreen();
              },
            ),
          );
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: kWhite,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: kBlack,
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: kBlack,
      );
      obscureText = false;
      notifyListeners();
    }
  }

  void disposeTextfield() {
    firstName.clear();
    lastName.clear();
    emailId.clear();
    password.clear();
    // phoneNo.clear();
    confirmPassword.clear();
    username.clear();
  }
}
