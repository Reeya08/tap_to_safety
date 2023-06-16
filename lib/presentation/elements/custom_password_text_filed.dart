import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class CustompPasswordTextField extends StatelessWidget {
   CustompPasswordTextField({
    super.key,
    required this.ImagePath,
    required this.LabelText,
   this.obscureText = true,
   required this.controller,
   this.validator,
   this.isPasswordField = true,
  });

  final String ImagePath;
  final String LabelText;
  final bool obscureText;
  final TextEditingController controller;
  final Function(String)? validator;
  final bool isPasswordField;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: (val) => validator!(val!),
        decoration: InputDecoration(
          icon:Image.asset(ImagePath),
          suffix: Image.asset('assets/images/hide-password.png'),
          hintText: LabelText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: AppConstants.secondaryColor,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: AppConstants.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppConstants.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
