import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';

import '../../elements/custom_text.dart';

class SafetyTipsView extends StatelessWidget {
  const SafetyTipsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: AppConstants.primaryColor,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  'assets/images/safety-tips-pic.png',
                  height: 200,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                text: '1 : Let girls’ and women’s voice be heard',
                fontSize: 22,
                textColor: AppConstants.primaryColor,
                textFontWeight: FontWeight.bold,
              ),
              const CustomText(
                text:
                    'Most importantly, #HearMeToo. Women and girls should be the at the centre of all design and delivery.',
                fontSize: 18,
                textColor: AppConstants.blackTextColor,
                textFontWeight: FontWeight.normal,
              ),
              const CustomText(
                text: '2 : Connect to those who know, who care',
                fontSize: 22,
                textColor: AppConstants.primaryColor,
                textFontWeight: FontWeight.bold,
              ),
              const CustomText(
                text:
                'When developing programmes, ensure local women’s and youth organisations are consulted and build on their best practices and evidence. And for the many men and boys who are champions for an end to GBV, let’s work together.',
                fontSize: 18,
                textColor: AppConstants.blackTextColor,
                textFontWeight: FontWeight.normal,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: '3 :  Light the way',
                    fontSize: 22,
                    textColor: AppConstants.primaryColor,
                    textFontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const CustomText(
                text:
                'All shelters, latrines, water points and pathways within camps must have ample lighting to reduce the risk of sexual violence.',
                fontSize: 18,
                textColor: AppConstants.blackTextColor,
                textFontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
