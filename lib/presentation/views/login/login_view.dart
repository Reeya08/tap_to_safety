import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';
import 'package:tap_to_safety/presentation/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:tap_to_safety/presentation/views/forgot_password/forgot_password_view.dart';

import '../../../helpers.dart';
import '../../../infrasturcture/services/auth_services.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      color: Colors.transparent,
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: AppConstants.whiteBackgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/login.png',
                    height: 300,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  ImagePath: 'assets/images/email.png',
                  LabelText: 'Email',
                  isPasswordField: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Email!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textInputType: TextInputType.text,
                  isPasswordField: true,
                  ImagePath: 'assets/images/password.png',
                  LabelText: 'Password',
                  controller: passwordController,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Password!';
                    } else if (val.length < 7) {
                      return 'Password must above 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.push(ForgotPasswordView(), context);
                      },
                      child: const CustomText(
                        text: 'Forgot Password?',
                        fontSize: 16,
                        textColor: AppConstants.secondaryColor,
                        textFontWeight: FontWeight.normal,
                      ),
                    ),
                     const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButton(
                  childText: 'Login',
                  height: 60,
                  width: 230,
                  textSize: 20,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setLoadingTrue();
                      AuthServices()
                          .loginUser(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) {
                        setLoadingFalse();
                        showDialog(
                            context: context,
                            builder: (context) {
                              emailController.clear();
                              passwordController.clear();
                              FocusManager.instance.primaryFocus!.unfocus();
                              return AlertDialog(
                                title: const Text("Message!"),
                                content: const Text("Login successfully"),
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppConstants.primaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomNavigationView()));
                                      },
                                      child: const Text("Okay",style: TextStyle(color: Colors.white),))
                                ],
                              );
                            });
                      }).onError((error, stackTrace) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              emailController.clear();
                              passwordController.clear();
                              return AlertDialog(
                                title: const Text("Alert!"),
                                content: Text(error.toString()),
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppConstants.primaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Okay"))
                                ],
                              );
                            });
                      });
                    }
                    // NavigationHelper.push(BottomNavigationView(), context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  setLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }
}
