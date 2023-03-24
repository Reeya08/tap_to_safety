import 'package:flutter/material.dart';
import 'package:tap_to_safety/presentation/views/edit_contacts/edit_contacts_view.dart';
import 'package:tap_to_safety/presentation/views/onboarding/onboarding_view.dart';
import 'package:tap_to_safety/presentation/views/safety_tips/safety_tips_view.dart';
import 'package:tap_to_safety/presentation/views/splash/splash_view.dart';
import 'package:tap_to_safety/presentation/views/view_contacts/view_contacts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      // home: OnboardingView1(),
      // home: OnboardingView3(),
      // home: OnboardingView4(),
      // home: LocationPermissionView(),
      // home: MessagePermissionView(),
      // home: SosSettingView(),
      // home: SignUpView(),
      // home: LoginView(),
      // home: ForgotPasswordView(),
      // home: ResetPasswordView(),
      // home: HomeView(),
      // home: BottomNavigationView(),
      // home: RegisterContactView(),
      //  home: ViewContactsView(),
      // home: EditContactsView(),
      // home: SafetyTipsView(),
      // home: OnboardingView(),
    );
  }
}
