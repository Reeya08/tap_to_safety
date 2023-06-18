import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/infrasturcture/models/complaint_model.dart';
import 'package:tap_to_safety/infrasturcture/services/complaint_services.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_complaint_section_text_field.dart';
import 'package:tap_to_safety/presentation/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';

class ComplaintView extends StatefulWidget {
  @override
  State<ComplaintView> createState() => _ComplaintViewState();
}
class _ComplaintViewState extends State<ComplaintView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ComplaintServices _complaintServices = ComplaintServices();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return LoadingOverlay(
      color: Colors.transparent,
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading:  GestureDetector(
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/edit_contact.jpeg',
                    height: 300,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomComplaintSectionTextField(
                  hintText: 'Name',
                  height: 50,
                  width: 260,
                  controller: nameController,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter your name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomComplaintSectionTextField(
                  hintText: 'Complaint',
                  height: 260,
                  width: 260,
                  controller: complaintController,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter your complaint';
                    } else {
                      return null;
                    }
                  },

                ),
                CustomButton(
                  childText: 'Submit',
                  height: 60,
                  width: 160,
                  onPressed: () async {
                    setLoadingTrue();
                    if (_formKey.currentState!.validate()) {
                      await ComplaintServices()
                          .submitComplaint(
                        ComplaintModel(
                          name: nameController.text.toString(),
                          complaint: complaintController.text.toString(),
                          date: DateTime.now(),
                        ),
                      )
                          .then((value) {
                        nameController.clear();
                        complaintController.clear();
                        FocusManager.instance.primaryFocus!.unfocus();
                        setLoadingFalse();
                        showDialog(
                            context: context,
                            builder: (context) {
                              FocusManager.instance.primaryFocus!.unfocus();
                              return AlertDialog(
                                title: const Text("Message!"),
                                content:
                                const Text("Complaint Submitted successfully"),
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants
                                            .primaryColor,
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
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants
                                            .primaryColor,
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
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  setLoadingTrue(){
    setState(() {
      isLoading = true;
    });
  }
  setLoadingFalse(){
    setState(() {
      isLoading = false;
    });
  }
}
