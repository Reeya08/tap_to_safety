import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_password_text_filed.dart';
import 'package:tap_to_safety/presentation/views/home/home_view.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/images/reset-password.png',
            height: 300,
            width: 300,
          ),
          const SizedBox(
            height: 60,
          ),
          const CustompPasswordTextField(
            ImagePath: 'assets/images/password.png',
            LabelText: 'New Password',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustompPasswordTextField(
            ImagePath: 'assets/images/password.png',
            LabelText: 'Confirm New Password',
          ),
          const SizedBox(
            height: 120,
          ),
          CustomButton(
            childText: 'Done',
            height: 60,
            width: 230,
            textSize: 20,
            onPressed: () {
              NavigationHelper.push(HomeView(), context);
            },
          ),
        ],
      ),
    );
  }
}
