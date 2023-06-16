import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';
import 'package:tap_to_safety/presentation/views/view_contacts/view_contacts_view.dart';

class EditContactsView extends StatelessWidget {
  final String name;
  final String phone;
  final String contactId;

  EditContactsView({
    Key? key,
    required this.name,
    required this.phone,
    required this.contactId,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    phoneController.text = phone;

    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
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
            CustomTextField(
              ImagePath: 'assets/images/name.png',
              LabelText: 'Name',
              controller: nameController,
              isPasswordField: false,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              textInputType: TextInputType.phone,
              ImagePath: 'assets/images/phone.png',
              LabelText: 'Phone',
              controller: phoneController,
              isPasswordField: false,
            ),
            const SizedBox(
              height: 120,
            ),
            CustomButton(
              childText: 'Save',
              height: 60,
              width: 150,
              onPressed: () {
                // Save the edited contact
                saveEditedContact(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void saveEditedContact(BuildContext context) {
    // Update the contact in Firestore using the contactId
    FirebaseFirestore.instance.collection('contacts').doc(contactId).update({
      'name': nameController.text,
      'phone': phoneController.text,
    }).then((value) {
      // Navigate back to ViewContactsView after successful update
      Navigator.pop(context);
    }).catchError((error) {
      // Handle the error, e.g., show an error message
      print('Failed to update contact: $error');
    });
  }
}
