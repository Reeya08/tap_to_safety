import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';

class RegisterContactView extends StatelessWidget {
  const RegisterContactView({Key? key}) : super(key: key);

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
            'assets/images/register-contact.png',
            height: 300,
            width: 300,
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomTextField(
            ImagePath: 'assets/images/name.png',
            LabelText: 'Name',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            ImagePath: 'assets/images/phone.png',
            LabelText: 'Phone',
          ),
          const SizedBox(
            height: 100,
          ),
          CustomButton(
            childText: 'Add Contact',
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
