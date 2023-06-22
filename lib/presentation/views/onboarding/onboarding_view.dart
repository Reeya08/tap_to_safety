import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../constants/app_constants.dart';
import '../../../infrasturcture/models/onboarding_model.dart';
import '../../elements/custom_button.dart';
import '../../elements/custom_onboarding.dart';
import '../../elements/custom_text.dart';
import '../../views/login/login_view.dart';
import '../../views/sign_up/sign_up_view.dart';

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
      imagePath: 'assets/images/onboarding 1.jpeg',
      text: 'Welcome to TapToSafety',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding 2.jpeg',
      text: 'Now women are safe!',
    ),
  ];

  Future<bool> _showExitConfirmationDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit Confirmation'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to cancel the exit.
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop(true); // Return true to confirm the exit.
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      return result;
    } else {
      throw Exception('Exit confirmation dialog dismissed');
    }
  }

  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      _controller.animateToPage(
        4,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Denied'),
            content: const Text(
              'Please grant location permission to continue.',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Denied'),
            content: const Text(
              'Please enable location access in the app settings to continue.',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Open Settings'),
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings();
                },
              ),
            ],
          );
        },
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestLocationPermission();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await _showExitConfirmationDialog();
        return shouldExit ?? false;
      },
      child: Scaffold(
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
                        curve: Curves.easeIn,
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  index == 3.0
                      ? const SizedBox(
                    height: 50,
                  )
                      : TextButton(
                    onPressed: () {
                      _controller.animateToPage(
                        4,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const CustomText(
                      text: 'Skip',
                      fontSize: 16,
                      textColor: AppConstants.blackTextColor,
                      textFontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (currentPageIndex) {
                    setState(() {
                      index = currentPageIndex;
                    });
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
                        Center(
                          child: Image.asset(
                            'assets/images/onboarding3.jpeg',
                            height: 300,
                            width: 300,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: CustomButton(
                            childText: 'Get Started',
                            height: 60,
                            width: 230,
                            textSize: 20,
                            onPressed: (){
                              _controller.animateToPage(4 ,duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                            }
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/onboarding4.jpeg',
                              height: 300,
                              width: 300,
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: CustomButton(
                              childText: 'Sign Up',
                              height: 60,
                              width: 230,
                              textSize: 20,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpView(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: 'Already have an account? ',
                                fontSize: 16,
                                textColor: AppConstants.blackTextColor,
                                textFontWeight: FontWeight.w500,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginView(),
                                    ),
                                  );
                                },
                                child: const CustomText(
                                  text: 'Login',
                                  fontSize: 16,
                                  textColor: AppConstants.secondaryColor,
                                  textFontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                  size: const Size.square(12.0),
                  activeSize: const Size(20.0, 12.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
