import 'package:cliffhub/controller/providers/email_validator.dart';
import 'package:cliffhub/controller/providers/login_provider.dart';
import 'package:cliffhub/controller/providers/otp_provider.dart';
import 'package:cliffhub/controller/providers/signup_provider.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/login_screen/log_in_screen.dart';
import 'package:cliffhub/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    final data = Provider.of<EmailValidatorProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const Text(
                          'Create Account',
                          style: TextStyle(
                              color: kBlack,
                              fontFamily: 'FredokaOne',
                              fontSize: 22),
                        ),
                        kSize,
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextField(
                                text: 'First Name',
                                controller: provider.firstName,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                                keyboard: TextInputType.name,
                              ),
                            ),
                            kWidth,
                            Flexible(
                              child: CustomTextField(
                                text: 'Last Name',
                                controller: provider.lastName,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                                keyboard: TextInputType.name,
                              ),
                            ),
                          ],
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
                          keyboard: TextInputType.name,
                        ),
                        kSize,
                        CustomTextField(
                          text: 'Email',
                          onChanged: (value) {
                            data.isEmail(value);
                          },
                          controller: provider.emailId,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }

                            return null;
                          },
                          keyboard: TextInputType.emailAddress,
                        ),
                        kSize,
                        CustomTextField(
                          text: 'Mobile Number',
                          controller: provider.phoneNo,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your mobile number';
                            } else if (value.length < 10) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                          keyboard: TextInputType.phone,
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
                              keyboard: TextInputType.visiblePassword,
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
                              keyboard: TextInputType.visiblePassword,
                            );
                          },
                        ),
                        kSize,
                        Consumer2<SignUpProvider, OtpProvider>(
                          builder: (context, value, value2, child) {
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
                                          value2.sendOtp(
                                              value.phoneNo.text, context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kBlack,
                                      ),
                                      child: const Text(
                                        'Signup',
                                        style: TextStyle(
                                          color: kWhite,
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                        kSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: kBlack),
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
                              child: const Text(
                                'Signin',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                ),
                              ),
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
