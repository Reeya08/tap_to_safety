import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';

class SosSettingView extends StatelessWidget {
  const SosSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 569,
              width: 300,
              decoration: BoxDecoration(
                color: AppConstants.whiteBackgroundColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          const Positioned(
            top: 120,
            left: 120,
            child: CustomText(
              text: 'SOS Settings',
              fontSize: 18,
              textColor: AppConstants.blackTextColor,
              textFontWeight: FontWeight.normal,
            ),
          ),
          Center(
            child: Container(
              height: 209,
              width: 101,
              decoration: BoxDecoration(
                color: AppConstants.sosSettingColor,
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(
                  color: AppConstants.blackTextColor,
                  width: 4,
                ),
              ),
            ),
          ),
          Positioned(
            top: 310,
            left: 165,
            child: Center(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppConstants.secondaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 550,
            left: 100,
            child: CustomText(
              text: 'Tap the fingerprint\n Sensor 3 times',
              fontSize: 18,
              textColor: AppConstants.sosSettingRed,
              textFontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
