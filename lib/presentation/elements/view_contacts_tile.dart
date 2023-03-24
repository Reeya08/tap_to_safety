import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import 'custom_text.dart';
class ViewContactsTile extends StatelessWidget {
  const ViewContactsTile({
  super.key,
  required this.titleText,
  required this.subTitleText,
  });
final String titleText;
final String subTitleText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/name.png',
      ),
      title: CustomText(
        text: titleText,
        fontSize: 18,
        textColor: AppConstants.primaryColor
        ,
        textFontWeight: FontWeight.normal,
      ),
      subtitle: CustomText(
        text: subTitleText,
        fontSize: 14,
        textColor: AppConstants.primaryColor,
        textFontWeight: FontWeight.normal,
      ),
    );
  }
}