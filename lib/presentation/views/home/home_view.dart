import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: Center(
        child: CircleAvatar(
          radius: 70,
          backgroundColor: AppConstants.primaryColor,
          child: CustomText(
            text: 'SOS',
            fontSize: 28,
            textColor: AppConstants.secondaryColor,
            textFontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
