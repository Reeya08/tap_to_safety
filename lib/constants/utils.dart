import 'package:flutter/material.dart';

class Utils {
  static showSnakBar(BuildContext context,
      {required String message, required Color color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }
}
