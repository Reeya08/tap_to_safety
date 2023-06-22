import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_dialog.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';

import '../../../infrasturcture/services/auth_services.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      color: Colors.transparent,
      isLoading: isLoading,
      child: Scaffold(
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
                   controller: emailController,
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
                      setLoadingTrue();
                      AuthServices()
                          .sendPasswordResetEmail(
                          email: emailController.text)
                          .then((value) {
                            setLoadingFalse();
                        showDialog(
                            context: context,
                            builder: (context) {
                              emailController.clear();
                              FocusManager.instance.primaryFocus!.unfocus();
                              return CustomDialog(messageContent: 'Check Your Email!', onPressed: (){ Navigator.pop(context);});
                            });
                      }).onError((error, stackTrace) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(messageContent: error.toString(), onPressed: (){ Navigator.pop(context);});
                            });
                      });
                    }
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
