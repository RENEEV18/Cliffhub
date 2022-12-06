import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/model/login_model/login_model.dart';
import 'package:cliffhub/services/login_api_service/login_service.dart';
import 'package:cliffhub/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController passwordlog = TextEditingController();

  LoginServices loginServices = LoginServices();
  bool isLoading = false;
  void logIn(BuildContext context) {
    isLoading = true;
    notifyListeners();
    final LoginModel loginModel = LoginModel(
      name: name.text,
      password: passwordlog.text,
    );
    loginServices.loginUser(loginModel, context).then(
      (value) {
        if (value != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
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
    color: kBlack,
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
    name.clear();
    passwordlog.clear();
  }
}
