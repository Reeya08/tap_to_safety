import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
class CustomSafetyTipsTextWidget extends StatelessWidget {
  const CustomSafetyTipsTextWidget({
  super.key,
  required this.tipName,
  required this.tipContent,
  });
  final String tipName;
  final String tipContent;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Let girls’ and women’s voice be heard',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          color: AppConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text:
            '\nMost importantly, #HearMeToo. Women\n'
                'and girls should be the at the centre'
                'of \nall design and delivery.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: AppConstants.blackTextColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}