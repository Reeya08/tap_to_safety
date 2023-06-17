import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: Center(
        child: GestureDetector(
          onTap: (){

          },
          child: CircleAvatar(
            radius: 70,
            backgroundColor: AppConstants.primaryColor,
            child: Text(
              'SOS',
              style: TextStyle(
                fontSize: 28,
                color: AppConstants.whiteBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}