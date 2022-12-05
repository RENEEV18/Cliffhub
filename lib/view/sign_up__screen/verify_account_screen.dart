import 'package:cliffhub/controller/providers/login_provider.dart';
import 'package:cliffhub/controller/providers/otp_provider.dart';
import 'package:cliffhub/controller/providers/signup_provider.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/login_screen/log_in_screen.dart';
import 'package:cliffhub/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyAccountScreen extends StatelessWidget {
  VerifyAccountScreen({super.key});

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
                          'Verify Account',
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'FredokaOne',
                              fontSize: 22),
                        ),
                        kSize,
                        CustomTextField(
                          text: 'Mobile Number',
                          controller: provider.phoneNo,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            else if(value.length<10){
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        kSize,
                        Consumer<SignUpProvider>(
                          builder: (context, value, child) {
                            return CustomTextField(
                              suffix: IconButton(
                                  onPressed: () {
                                    value.visibility();
                                  },
                                  icon: value.icon),
                              text: 'Password',
                              obscureText: value.obscureText,
                              controller: provider.password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value.length < 8) {
                                  return 'Password must have atleast 8 character';
                                } else if (value.length > 8) {
                                  return 'Password exceeds 8 character';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        kSize,
                        Consumer<LoginProvider>(
                          builder: (context, value, child) {
                            return CustomTextField(
                              suffix: IconButton(
                                  onPressed: () {
                                    value.visibility();
                                  },
                                  icon: value.icon),
                              text: 'Confirm Password',
                              obscureText: value.obscureText,
                              controller: provider.confirmPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value.length < 8) {
                                  return 'Password must have atleast 8 character';
                                } else if (value.length > 8) {
                                  return 'Password exceeds 8 character';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        kSize,
                        Consumer2<SignUpProvider,OtpProvider>(
                          builder: (context, value,value2, child) {
                            return value.isLoading
                                ? const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (formGlobalKey.currentState!
                                              .validate()) {
                                            formGlobalKey.currentState!.save();

                                            value.registerUser(context);
                                            value2.sendOtp();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 3, 49, 134),
                                        ),
                                        child: const Text(
                                          'Signup',
                                          style: TextStyle(
                                            color: kWhite,
                                          ),
                                        )),
                                  );
                          },
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
                                child: const Text('Signin')),
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