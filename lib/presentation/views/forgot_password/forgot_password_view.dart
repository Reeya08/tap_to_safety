import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';

import '../../../infrasturcture/services/auth_services.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/images/reset_password.jpeg',
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 80,
              ),
               CustomTextField(
                 textInputType: TextInputType.emailAddress,
                ImagePath: 'assets/images/email.png',
                LabelText: 'Enter Email',
                 controller: email_controller,
                 isPasswordField: false,
                 validator: (val) {
                   if (val.isEmpty) {
                     return "Enter Your Email ";
                   } else {
                     return null;
                   }
                 },
              ),
              const SizedBox(
                height: 160,
              ),
              CustomButton(
                childText: 'Send Code',
                height: 60,
                width: 230,
                textSize: 20,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthServices()
                        .sendPasswordResetEmail(
                        email: email_controller.text)
                        .then((value) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            email_controller.clear();
                            FocusManager.instance.primaryFocus!.unfocus();
                            return AlertDialog(
                              title: const Text("Message!"),
                              content: const Text("Check Your Email"),
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
                            return AlertDialog(
                              title: const Text("Alert!"),
                              content: Text(error.toString()),
                              actions: [
                                ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
