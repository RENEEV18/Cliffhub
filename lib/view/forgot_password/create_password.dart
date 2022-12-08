import 'package:cliffhub/controller/providers/forgot_password.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create new password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                  ),
                ),
                kSize,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    text: 'Username or Email',
                    controller: data.verifyUsername,
                    validator: (username) {
                      if (username == null) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    keyboard: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    text: 'New Password',
                    controller: data.newPassword,
                    validator: (newPassword) {
                      if (newPassword == null) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    keyboard: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    text: 'Confirm Password',
                    controller: data.confirmPassword,
                    validator: (confirmPassword) {
                      if (confirmPassword == null) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    keyboard: TextInputType.name,
                  ),
                ),
                kSize,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlack,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
                kSize,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
