import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_password_text_filed.dart';

import '../../../infrasturcture/models/user_model.dart';
import '../../../infrasturcture/services/auth_services.dart';
import '../../../infrasturcture/services/user_services.dart';
import '../../elements/custom_text.dart';
import '../../elements/custom_text_field.dart';
import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';
import '../login/login_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name_controller = TextEditingController();
  final TextEditingController phone_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController confirm_password_controller = TextEditingController();
  final UserServices _userServices = UserServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'assets/images/sign_up.jpeg',
                ),
              ),
              CustomTextField(
                textInputType: TextInputType.name,
                controller: name_controller,
                ImagePath: 'assets/images/name.png',
                LabelText: 'Full Name', isPasswordField: false,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter your full name';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: email_controller,
                isPasswordField: false,
                ImagePath: 'assets/images/email.png',
                LabelText: 'Email',
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter your email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                textInputType: TextInputType.phone,
                controller: phone_controller,
                ImagePath: 'assets/images/phone.png',
                LabelText: 'Phone', isPasswordField: false,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter Phone Number!';
                  } else if (val.length != 11) {
                    return 'Phone number must be 11 Numbers';
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
                controller: password_controller,
                ImagePath: 'assets/images/password.png', LabelText: 'Password',
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
                height: 20,
              ),
              CustomTextField(
                textInputType: TextInputType.text,
                isPasswordField: true,
                controller: confirm_password_controller,
                ImagePath: 'assets/images/password.png',
                LabelText: 'Confirm Password',
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Confirm your Password!';
                  } else if (confirm_password_controller.text !=
                      password_controller.text) {
                    return 'Password dose not match';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                childText: 'Sign Up',
                height: 60,
                width:230,
                textSize: 20,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthServices()
                        .signUp(
                        email: email_controller.text,
                        password: password_controller.text)
                    .then((UserCredential userCredential) {
                      User? user = userCredential.user;
                      if (user != null){
                        UserModel userModel = UserModel(
                          uid: user.uid,
                          fullName: name_controller.text,
                          email: email_controller.text,
                          phone: phone_controller.text,
                        );
                        _userServices.addUser(userModel);
                      }
                    })

                        .then((value) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            name_controller.clear();
                            email_controller.clear();
                            phone_controller.clear();
                            password_controller.clear();
                            confirm_password_controller.clear();
                            FocusManager.instance.primaryFocus!.unfocus();
                            return AlertDialog(
                              title: const Text("Message!"),
                              content: const Text("SignUp successfully"),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppConstants.primaryColor,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Okay"))
                              ],
                            );
                          });
                    }).onError((error, stackTrace) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            name_controller.clear();
                            email_controller.clear();
                            phone_controller.clear();
                            password_controller.clear();
                            confirm_password_controller.clear();
                            return AlertDialog(
                              title: const Text("Alert!"),
                              content: Text(error.toString()),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppConstants.primaryColor,
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
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomText(
              //       text: 'Already have an account? ',
              //       fontSize: 16,
              //       textColor: AppConstants.blackTextColor,
              //       textFontWeight: FontWeight.w500,
              //     ),
              //     GestureDetector(
              //         onTap: () {
              //           NavigationHelper.push(LoginView(), context);
              //         },
              //         child: CustomText(
              //           text: 'Login',
              //           fontSize: 16,
              //           textColor: AppConstants.secondaryColor,
              //           textFontWeight: FontWeight.bold,
              //         )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}