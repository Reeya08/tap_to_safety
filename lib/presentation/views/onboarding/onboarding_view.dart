import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_permission_dialauge.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
import 'package:tap_to_safety/presentation/views/login/login_view.dart';
import 'package:tap_to_safety/presentation/views/sign_up/sign_up_view.dart';

import '../../../constants/app_constants.dart';
import '../../../models/onboarding_model.dart';
import '../../elements/custom_button.dart';
import '../../elements/custom_onboarding.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int index = 0;
  List<OnboardingModel> onboardingScreens = [
    OnboardingModel(
      imagePath: 'assets/images/onboarding1 (1).png',
      text: 'Wellcome to TapToSafety',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding2.png',
      text: 'Now women are safe!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            index == 0
                ? const SizedBox(
              height: 50,
            )
                : IconButton(
                onPressed: () {
                  _controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: const Icon(Icons.arrow_back)),
            index == 3.0
                ? const SizedBox(
              height: 50,
            )
                : TextButton(
              onPressed: () {
                _controller.animateToPage(
                    4,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: CustomText(text: 'Skip',
                fontSize: 16,
                textColor: AppConstants.blackTextColor,
                textFontWeight: FontWeight.w500,),
            ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (currentPageIndex) {
                  index = currentPageIndex;
                  setState(() {});
                },
                children: [
                  CustomOnboarding(
                    imagePath: onboardingScreens[0].imagePath,
                    onboardingText: onboardingScreens[0].text,
                  ),
                  CustomOnboarding(
                    imagePath: onboardingScreens[1].imagePath,
                    onboardingText: onboardingScreens[1].text,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 100,),
                      Center(
                          child: Image.asset(
                            'assets/images/onboarding2.png',
                            height: 300,
                            width: 300,
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: CustomButton(
                            childText: 'Get Started',
                            height: 60,
                            width: 230,
                            textSize: 20,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    CustomPermissionDialoge(
                                      permissionText:
                                      'Allow TapToSafety To Access the device’s location?',
                                    ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/onboarding4 (1).png',
                          height: 300,
                          width: 300,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomButton(
                            childText: 'Sign Up',
                            height: 60,
                            width: 230,
                            textSize: 20,
                            onPressed: () {
                              NavigationHelper.push(SignUpView(), context);
                            }),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppConstants.google,
                          const SizedBox(
                            width: 20,
                          ),
                          AppConstants.facebook,
                          const SizedBox(
                            width: 20,
                          ),
                          AppConstants.instagram,
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Already have an account? ',
                            fontSize: 16,
                            textColor: AppConstants.blackTextColor,
                            textFontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                              onTap: () {
                                NavigationHelper.push(LoginView(), context);
                              },
                              child: CustomText(
                                text: 'Login',
                                fontSize: 16,
                                textColor: AppConstants.secondaryColor,
                                textFontWeight: FontWeight.bold,
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DotsIndicator(
              dotsCount: 4,
              position: index.toDouble(),
              decorator: DotsDecorator(
                color: AppConstants.secondaryColor,
                activeColor: AppConstants.sosSettingColor,
                size: Size.square(12.0),
                activeSize: Size(20.0, 12.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
