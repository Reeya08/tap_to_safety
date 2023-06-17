import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class CustomComplaintSectionTextField extends StatelessWidget {
  const CustomComplaintSectionTextField({
    Key? key,
    required this.hintText,
    required this.height,
    required this.width,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final double height;
  final double width;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: AppConstants.secondaryColor,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
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
