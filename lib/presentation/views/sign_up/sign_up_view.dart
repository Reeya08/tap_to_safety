import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import '../../../infrasturcture/models/user_model.dart';
import '../../../infrasturcture/services/auth_services.dart';
import '../../../infrasturcture/services/user_services.dart';
import '../../elements/custom_text_field.dart';
import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';
class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  final UserServices _userServices = UserServices();

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: LoadingOverlay(
        color: Colors.transparent,
        isLoading: isLoading,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/sigu_up.jpeg',
                  ),
                ),
                CustomTextField(
                  textInputType: TextInputType.name,
                  controller: nameController,
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
                  controller: emailController,
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
                  controller: phoneController,
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
                  controller: passwordController,
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
                  controller: confirmPasswordController,
                  ImagePath: 'assets/images/password.png',
                  LabelText: 'Confirm Password',
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Confirm your Password!';
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
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
                      setLoadingTrue();
                      AuthServices()
                          .signUp(
                          email: emailController.text,
                          password: passwordController.text)
                          .then((UserCredential userCredential) {
                        User? user = userCredential.user;
                        if (user != null){
                          UserModel userModel = UserModel(
                            uid: user.uid,
                            fullName: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,


                          );
                          _userServices.addUser(userModel);
                        }
                      })

                          .then((value) {
                        setLoadingFalse();
                        showDialog(
                            context: context,
                            builder: (context) {
                              nameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                              FocusManager.instance.primaryFocus!.unfocus();
                              return AlertDialog(
                                title: const Text("Message!"),
                                content:  const Text("SignUp successfully"),
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants.primaryColor,
                                      ),
                                      onPressed: () {
                                        NavigationHelper.push(BottomNavigationView(), context);
                                      },
                                      child: const Text("Okay"))
                                ],
                              );
                            });
                      }).onError((error, stackTrace) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              nameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  setLoadingFalse(){
    setState(() {
      isLoading = false;
    });
  }
  setLoadingTrue(){
    setState(() {
      isLoading = true;
    });
  }
}