import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
import 'package:tap_to_safety/presentation/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:tap_to_safety/presentation/views/edit_contacts/edit_contacts_view.dart';
import 'package:tap_to_safety/presentation/views/sign_up/sign_up_view.dart';

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
      if(FirebaseAuth.instance.currentUser != null){
        NavigationHelper.push(BottomNavigationView(), context);
      }
      else{
        NavigationHelper.push(OnboardingView(), context);
      }
       });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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