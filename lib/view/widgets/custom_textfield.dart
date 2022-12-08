import 'package:cliffhub/core/constants/const.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    this.suffix,
    required this.controller,
    required this.validator,
    this.obscureText, required this.keyboard,
  }) : super(key: key);

  final String text;
  final Widget? suffix;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool? obscureText;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: obscureText ?? false,
        keyboardType: keyboard,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffix,
          label: Text(
            text,
            style: kUsernameStyle,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kBlack),
          ),
        ),
      ),
    );
  }
}
