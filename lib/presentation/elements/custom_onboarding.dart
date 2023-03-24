import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';

import 'custom_text.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({
    super.key,
    required this.imagePath,
    required this.onboardingText,
  });

  final String imagePath;
  final String onboardingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  SizedBox(
        //   height: 10,
        // ),
        //  Padding(
        //   padding: EdgeInsets.only(
        //     top: 0,
        //     right: 2,
        //     left: 250,
        //     bottom: 250,
        //   ),
        //    Row(
        //      mainAxisAlignment: MainAxisAlignment.end,
        //      children: [
        //        CustomText(
        //         text: 'Skip',
        //         fontSize: 14,
        //         textFontWeight: FontWeight.w500,
        //         textColor: AppConstants.primaryColor,
        //   ),
        //      ],
        //    ),
        // ),
        // SizedBox(
        //   height: 80,
        // ),
        Image.asset(
          (imagePath),
          height: 300,
          width: 300,
        ),
        // SizedBox(
        //   height: 50,
        // ),
        CustomText(
          text: onboardingText,
          fontSize: 16,
          textFontWeight: FontWeight.w700,
          textColor: AppConstants.primaryColor,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CircleAvatar(radius: 5,backgroundColor: AppConstants.secondaryColor,),
        //     SizedBox(width: 20,),
        //     CircleAvatar(radius: 5,backgroundColor: AppConstants.secondaryColor,),
        //     SizedBox(width: 20,),
        //     CircleAvatar(radius: 5,backgroundColor: AppConstants.secondaryColor,),
        //     SizedBox(width: 20,),
        //     CircleAvatar(radius: 5,backgroundColor: AppConstants.secondaryColor,),
        //   ],
        // ),
      ],
    );
  }
}
