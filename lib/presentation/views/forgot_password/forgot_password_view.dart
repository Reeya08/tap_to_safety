import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/forgot-password.png',
            height: 300,
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          const CustomTextField(
            ImagePath: 'assets/images/email.png',
            LabelText: 'Enter Email',
          ),
          const SizedBox(
            height: 160,
          ),
          CustomButton(
            childText: 'Send Code',
            height: 60,
            width: 230,
            textSize: 20,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
