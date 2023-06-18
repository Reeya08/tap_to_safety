import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class CustomComplaintSectionTextField extends StatefulWidget {
  const CustomComplaintSectionTextField({
    Key? key,
    required this.hintText,
    required this.height,
    required this.width,
    required this.controller,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final double height;
  final double width;
  final TextEditingController controller;
  final Function(String)? validator;

  @override
  State<CustomComplaintSectionTextField> createState() => _CustomComplaintSectionTextFieldState();
}

class _CustomComplaintSectionTextFieldState extends State<CustomComplaintSectionTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        validator: (val) => widget.validator!(val!),
        decoration: InputDecoration(
          hintText: widget.hintText,
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
