import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_permission_dialauge.dart';

class MessagePermissionView extends StatelessWidget {
  const MessagePermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Center(
        child: CustomPermissionDialoge(
          permissionText:
              'Allow TapToSafety to\n send and to send and\n view messages?',
        ),
      ),
    );
  }
}
