import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';
import 'package:tap_to_safety/presentation/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
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
            CustomTextField(
              isPasswordField: true,
              controller: newPasswordController,
              ImagePath: 'assets/images/password.png',
              LabelText: 'New Password',
              textInputType: TextInputType.text,
              validator: (val) {
                if (val.isEmpty) {
                  return "Enter Your Email ";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              isPasswordField: true,
              textInputType: TextInputType.text,
              controller: confirmNewPasswordController,
              ImagePath: 'assets/images/password.png',
              LabelText: 'Confirm New Password',
              validator: (val) {
                if (val == newPasswordController) {
                  return "Password Updated!";
                } else {
                  return null;
                }
              },
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
                NavigationHelper.push(const BottomNavigationView(), context);

              },
            ),
          ],
        ),
      ),
    );
  }
}
