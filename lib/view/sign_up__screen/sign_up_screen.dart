import 'package:cliffhub/controller/providers/signup_provider.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/login_screen/log_in_screen.dart';
import 'package:cliffhub/view/widgets/custom_textfield.dart';
import 'package:cliffhub/view/sign_up__screen/verify_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        kContainerSize,
                        const Text(
                          'Create Account',
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'FredokaOne',
                              fontSize: 22),
                        ),
                        kSize,
                        CustomTextField(
                          text: 'First Name',
                          controller: provider.firstName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        kSize,
                        CustomTextField(
                          text: 'Last Name',
                          controller: provider.lastName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        kSize,
                        CustomTextField(
                          text: 'Username',
                          controller: provider.username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        kSize,
                        CustomTextField(
                          text: 'Email',
                          controller: provider.emailId,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        kSize,
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              ElevatedButton(
                                onPressed: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return VerifyAccountScreen();
                                        },
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 3, 49, 134),
                                ),
                                child: const Icon(
                                  Icons.navigate_next,
                                  color: kWhite,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        kSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: kWhite),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Signin'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}