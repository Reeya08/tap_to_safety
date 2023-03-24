import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_password_text_filed.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';
import 'package:tap_to_safety/presentation/views/reset_password/reset_password_view.dart';

import '../../../helpers.dart';
import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              'assets/images/login.png',
              height: 300,
              width: 300,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const CustomTextField(
            ImagePath: 'assets/images/email.png',
            LabelText: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustompPasswordTextField(
            ImagePath: 'assets/images/password.png',
            LabelText: 'Password',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  NavigationHelper.push(ResetPasswordView(), context);
                },
                child: CustomText(
                  text: 'Forgot Password?',
                  fontSize: 16,
                  textColor: AppConstants.secondaryColor,
                  textFontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          CustomButton(
            childText: 'Login',
            height: 60,
            width: 230,
            textSize: 20,
            onPressed: () {
              NavigationHelper.push(BottomNavigationView(), context);
            },
          ),
        ],
      ),
    );
  }
}
