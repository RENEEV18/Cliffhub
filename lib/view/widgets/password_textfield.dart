import 'package:cliffhub/controller/providers/login_provider.dart';
import 'package:cliffhub/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.controller, this.validator});
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Consumer<LoginProvider>(
        builder: (context, value, child) {
          return TextFormField(
            obscureText: value.obscureText,
            controller: controller,
            validator: validator,
            style: const TextStyle(color: kWhite),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  value.visibility();
                },
                icon: value.icon,
              ),
              label: const Text(
                'Password',
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
          );
        },
      ),
    );
  }
}
