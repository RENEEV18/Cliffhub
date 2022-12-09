import 'package:cliffhub/controller/providers/forgot_password.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/fd84d4d8f5ba8f89638bbf309e986682.png',
                  width: 300,
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Manrope',
                    color: kBlack,
                  ),
                ),
                const Text(
                  'Plaese enter your username \n or email ',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400, color: kGrey),
                ),
                kSize,
                Consumer<ForgotPasswordProvider>(
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: formGlobalKey,
                        child: CustomTextField(
                          text: 'Username or Email',
                          controller: value.verifyUsername,
                          validator: (username) {
                            if (username!.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          keyboard: TextInputType.name,
                        ),
                      ),
                    );
                  },
                ),
                kSize,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        data.forgotUserPassword(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlack,
                    ),
                    child: const Text(
                      'Next',
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
