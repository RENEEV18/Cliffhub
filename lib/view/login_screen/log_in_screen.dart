import 'package:cliffhub/controller/providers/login_provider.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/widgets/clippath.dart';
import 'package:cliffhub/view/widgets/custom_textfield.dart';
import 'package:cliffhub/view/login_screen/widgets/maintext_widget.dart';
import 'package:cliffhub/view/sign_up__screen/sign_up_screen.dart';
import 'package:cliffhub/view/widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kBlack,
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: kYellow,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kContainerSize,
                          Row(
                            children: const [
                              MainTextWidget(),
                            ],
                          ),
                          const Text(
                            'Make your moments more beautiful and\n elegance. ',
                            style: kSubTextStyle,
                          ),
                        ],
                      ),
                    ),
                    kSize,
                    CustomTextField(
                      text: 'Username',
                      controller: data.name,
                      validator: (username) {
                        if (username!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    kSize,
                    PasswordField(
                      controller: data.passwordlog,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot password?'),
                          ),
                        ],
                      ),
                    ),
                    Consumer<LoginProvider>(
                      builder: (context, value, child) {
                        return value.isLoading == true
                            ? const CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      formGlobalKey.currentState!.save();
                                      value.logIn(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 3, 49, 134),
                                  ),
                                  child: const Text(
                                    'Signin',
                                    style: TextStyle(color: kWhite),
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
                          "Don't have an account?",
                          style: TextStyle(color: kWhite),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                          child: const Text('Create Account'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
