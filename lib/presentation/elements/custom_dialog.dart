

import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../views/bottom_navigation_bar/bottom_navigation_bar_view.dart';
class CustomDialog extends StatelessWidget {
   CustomDialog({
  super.key,
  required this.messageContent,
  required this.onPressed,
  });
  final String messageContent;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Message!"),
      content:  Text(messageContent),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
              AppConstants.primaryColor,
            ),
            onPressed:onPressed,
            child: const Text("Okay",style: TextStyle(color: Colors.white),))
      ],
    );
  }
}