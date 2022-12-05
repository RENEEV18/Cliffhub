import 'package:cliffhub/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSize,
              Image.asset(
                'assets/images/1412_otp_verification.png',
                width: 300,
              ),
              const Text(
                'Verification code',
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.w500, color: kWhite),
              ),
              const Text(
                'Plaese enter the 6 digit code that \nwas send to your number  ',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400, color: kGrey),
              ),
              kSize,
              OtpTextField(
                textStyle: const TextStyle(color: Colors.amber),
                numberOfFields: 6,
                borderColor: kWhite,
                borderRadius: BorderRadius.circular(12),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    },
                  );
                },
              ),
              kSize,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kYellow,
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: kBlack),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
