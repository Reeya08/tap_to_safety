import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import 'custom_text.dart';
class CustomOtherHelplineTile extends StatelessWidget {
  const CustomOtherHelplineTile({
  super.key,
  required this.title,
  required this.subTitle,
  });
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/name.png'),
      title: CustomText(
        text: title,
        fontSize: 18,
        textColor: AppConstants.primaryColor,
        textFontWeight: FontWeight.w500,
      ),
      subtitle: CustomText(
        text: subTitle,
        fontSize: 14,
        textColor: AppConstants.primaryColor,
        textFontWeight: FontWeight.w500,
      ),
    );
  }
}