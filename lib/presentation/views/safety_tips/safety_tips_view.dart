import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';

import '../../elements/custom_safety_tips_text_widget.dart';

class SafetyTipsView extends StatelessWidget {
  const SafetyTipsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset(
              'assets/images/safety-tips-pic.png',
              height: 300,
              width: 300,
            ),
          ),

        ],
      ),
    );
  }
}


