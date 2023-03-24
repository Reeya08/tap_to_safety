import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';

class CustomPermissionDialoge extends StatelessWidget {
  const CustomPermissionDialoge({
    Key? key,
    required this.permissionText,
  }) : super(key: key);
  final String permissionText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        // height: 250,
        // width: 300,
        decoration: BoxDecoration(
          color: AppConstants.secondaryColor,
          borderRadius: BorderRadius.circular(25.0),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              permissionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppConstants.whiteBackgroundColor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: CustomButton(
                          childText: 'Allow',
                          height: 60,
                          width: 130,
                          textSize: 12,
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: CustomButton(
                          childText: 'Deny',
                          height: 60,
                          width: 130,
                          textSize: 12,
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
