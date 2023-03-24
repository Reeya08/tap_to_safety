import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_password_text_filed.dart';

import '../../elements/custom_text_field.dart';
import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/images/sign-up.png',
              ),
            ),
            const CustomTextField(
              ImagePath: 'assets/images/name.png',
              LabelText: 'Full Name',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              ImagePath: 'assets/images/email.png',
              LabelText: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              ImagePath: 'assets/images/phone.png',
              LabelText: 'Phone',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustompPasswordTextField(
                ImagePath: 'assets/images/password.png', LabelText: 'Password'),
            const SizedBox(
              height: 20,
            ),
            const CustompPasswordTextField(
                ImagePath: 'assets/images/password.png',
                LabelText: 'Confirm Password'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              childText: 'Sign Up',
              height: 60,
              width: 230,
              textSize: 20,
              onPressed: () {
                NavigationHelper.push(BottomNavigationView(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
