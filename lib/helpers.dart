import 'package:flutter/material.dart';

class NavigationHelper {
  static push(Widget nextScreen, BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextScreen));
  }
}
