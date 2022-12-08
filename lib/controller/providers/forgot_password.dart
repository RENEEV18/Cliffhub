import 'package:cliffhub/services/forgot_password/forgot_password.dart';
import 'package:cliffhub/view/forgot_password/create_password.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final TextEditingController verifyUsername = TextEditingController();

  final TextEditingController newPassword = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;
  ForgotPasswordService forgotPasswordService = ForgotPasswordService();

  void forgotUserPassword(BuildContext context) {
    isLoading = true;
    notifyListeners();
    forgotPasswordService.forgotPassword(verifyUsername.text, context).then(
      (value) {
        if (value != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreatePasswordScreen(),
            ),
          );
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
