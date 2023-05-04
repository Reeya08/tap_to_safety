import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
class CustomComplaintSectionTextField extends StatelessWidget {
  const CustomComplaintSectionTextField({
  super.key,
  required this.hintText,
   required this.height,
   required this.width,
  });
final String hintText;
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: AppConstants.secondaryColor,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: AppConstants.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppConstants.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}