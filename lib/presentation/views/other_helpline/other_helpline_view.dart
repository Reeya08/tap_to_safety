import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_other_helpline_tile.dart';
import 'package:tap_to_safety/presentation/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';

import '../../../constants/app_constants.dart';

class OtherHelpline extends StatelessWidget {
  const OtherHelpline({Key? key}) : super(key: key);

  Future<void> _callHelpline(String helplineNumber) async {
    await FlutterPhoneDirectCaller.callNumber(helplineNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            NavigationHelper.push(const BottomNavigationView(), context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppConstants.primaryColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/images/other_helpline.jpeg',
                height: 300,
                width: 300,
              ),
            ),
            GestureDetector(
              onTap: () {
                _callHelpline('1122');
              },
              child: const CustomOtherHelplineTile(title: 'Rescue Helpline', subTitle: '1122'),
            ),
            GestureDetector(
              onTap: () {
                _callHelpline('115');
              },
              child: const CustomOtherHelplineTile(title: 'Edhi Ambulance Helpline', subTitle: '115'),
            ),
            GestureDetector(
              onTap: () {
                _callHelpline('1101');
              },
              child: const CustomOtherHelplineTile(title: 'Rangers Helpline', subTitle: '1101'),
            ),
            GestureDetector(
              onTap: () {
                _callHelpline('15');
              },
              child: const CustomOtherHelplineTile(title: 'Police Madadgar Helpline', subTitle: '15'),
            ),
            GestureDetector(
              onTap: () {
                _callHelpline('16');
              },
              child: const CustomOtherHelplineTile(title: 'Fire Brigade Helpline', subTitle: '16'),
            ),
            GestureDetector(
              onTap: () {
                _callHelpline('03331957664');
              },
              child: const CustomOtherHelplineTile(title: 'Police', subTitle: '03331957664'),
            ),
          ],
        ),
      ),
    );
  }
}
