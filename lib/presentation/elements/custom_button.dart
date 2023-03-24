import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.childText,
    required this.height,
    required this.width,
     this.textSize = 20,
    this.radius = 12,
    required this.onPressed,
  }) : super(key: key);
  final String childText;
  final double height;
  final double width;
  final double textSize;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 12,
          backgroundColor: AppConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: CustomText(
          text: childText,
          fontSize: textSize,
          textColor: AppConstants.whiteBackgroundColor,
          textFontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
