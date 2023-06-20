import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.obscureText = false,
    required this.controller,
    this.validator,
    required this.ImagePath,
    this.isPasswordField = false,
    required this.LabelText,
    this.isObscure = false,
    required this.textInputType,
  });

  final bool obscureText;
  final TextEditingController controller;
  final Function(String)? validator;
  final String ImagePath;
  final String LabelText;
  bool? isObscure;
  final bool? isPasswordField;
  final TextInputType textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.isPasswordField! ? widget.isObscure! : false,
        controller: widget.controller,
        validator: (val) => widget.validator!(val!),
        decoration: InputDecoration(
          icon: Image.asset(
            widget.ImagePath,
            width: 40,
            height: 40,
          ),
          hintText: widget.LabelText,
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
          suffixIcon: widget.isPasswordField!
              ? GestureDetector(
                  onTap: () {
                    widget.isObscure = !widget.isObscure!;
                    setState(() {});
                  },
                  child: widget.isObscure ?? false
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
