import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.textColor,
      required this.textFontWeight})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight textFontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: textFontWeight,
          ),
        ));
  }
}
