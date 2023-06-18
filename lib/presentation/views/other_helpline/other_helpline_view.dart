import 'package:flutter/material.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_other_helpline_tile.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
import 'package:tap_to_safety/presentation/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';

import '../../../constants/app_constants.dart';

class OtherHelpline extends StatelessWidget {
  const OtherHelpline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:GestureDetector(
          onTap: (){
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
            const CustomOtherHelplineTile(title: 'Rescue Helpline', subTitle: '1122'),
            const CustomOtherHelplineTile(title: 'Edhi Ambulance Helpline', subTitle: '115'),
            const CustomOtherHelplineTile(title: 'Rangers Helpline', subTitle: '1101'),
            const CustomOtherHelplineTile(title: 'Police Madadgar Helpline', subTitle: '15'),
            const CustomOtherHelplineTile(title: 'Fire Brigade Helpline', subTitle: '16'),

          ],
        ),
      ),
    );
  }
}


