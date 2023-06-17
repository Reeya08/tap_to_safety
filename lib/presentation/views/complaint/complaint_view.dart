import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/infrasturcture/services/complaint_services.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_complaint_section_text_field.dart';

class ComplaintView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = '';
    String complaint = '';
    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back,
          color: AppConstants.primaryColor,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LoadingOverlay(
          isLoading: isLoading,
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
              SizedBox(
                height: 40,
              ),
              CustomComplaintSectionTextField(
                hintText: 'Name',
                height: 50,
                width: 260,
                onChanged: (value) {
                  name = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomComplaintSectionTextField(
                hintText: 'Complaint',
                height: 260,
                width: 260,
                onChanged: (value) {
                  complaint = value;
                },
              ),
              CustomButton(
                childText: 'Submit',
                height: 60,
                width: 160,
                onPressed: () {
                  isLoading = true;
                  ComplaintServices()
                      .submitComplaint(name, complaint)
                      .then((value) {
                    isLoading = false;
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
                },
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
