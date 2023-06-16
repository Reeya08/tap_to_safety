import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';

import '../onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      NavigationHelper.push( OnboardingView(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center
            (
              child: AppConstants.logoImage),
          const CustomText(
            text: 'TapToSafety',
            fontSize: 26,
            textColor: AppConstants.primaryColor,
            textFontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
