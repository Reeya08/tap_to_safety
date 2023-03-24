import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.ImagePath,
    required this.LabelText,
  });

  final String ImagePath;
  final String LabelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImagePath),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 50,
          width: 260,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: LabelText,
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
        ),
      ],
    );
  }
}
