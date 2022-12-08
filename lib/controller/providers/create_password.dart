import 'package:cliffhub/services/forgot_password/create_password.dart';
import 'package:cliffhub/view/login_screen/log_in_screen.dart';
import 'package:flutter/material.dart';

class CreatePasswordProvider extends ChangeNotifier {
  bool isLoading = false;
  CreatePasswordService createPasswordService = CreatePasswordService();

  void newPassword(BuildContext context, String emailId, String password) {
    isLoading = true;
    notifyListeners();

    createPasswordService.createPassword(emailId, password, context).then(
      (value) {
        if (value != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      },
    );
  }
}
