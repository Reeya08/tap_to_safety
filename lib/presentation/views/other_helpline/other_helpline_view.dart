import 'package:flutter/material.dart';
import 'package:tap_to_safety/presentation/elements/custom_other_helpline_tile.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';

import '../../../constants/app_constants.dart';

class OtherHelpline extends StatelessWidget {
  const OtherHelpline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: AppConstants.primaryColor,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/images/other-helpline-pic.png',
                height: 300,
                width: 300,
              ),
            ),
            CustomOtherHelplineTile(title: 'Rescue Helpline', subTitle: '1122'),
            CustomOtherHelplineTile(title: 'Edhi Ambulance Helpline', subTitle: '115'),
            CustomOtherHelplineTile(title: 'Rangers Helpline', subTitle: '1101'),
            CustomOtherHelplineTile(title: 'Police Madadgar Helpline', subTitle: '15'),
            CustomOtherHelplineTile(title: 'Fire Brigade Helpline', subTitle: '16'),

          ],
        ),
      ),
    );
  }
}


