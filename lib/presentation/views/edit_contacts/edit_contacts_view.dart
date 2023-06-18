import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';
import 'package:tap_to_safety/presentation/views/view_contacts/view_contacts_view.dart';

class EditContactsView extends StatefulWidget {
  final String name;
  final String phone;
  final String contactId;

  EditContactsView({
    Key? key,
    required this.name,
    required this.phone,
    required this.contactId,
  }) : super(key: key);

  @override
  State<EditContactsView> createState() => _EditContactsViewState();
}

class _EditContactsViewState extends State<EditContactsView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    nameController.text = widget.name;
    phoneController.text = widget.phone;

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

  void saveEditedContact(BuildContext context) {
    // Update the contact in Firestore using the contactId
    setLoadingTrue();
    FirebaseFirestore.instance.collection('contacts').doc(widget.contactId).update({
      'name': nameController.text,
      'phone': phoneController.text,
    }).then((value) {
      setLoadingFalse();
      // Navigate back to ViewContactsView after successful update
      Navigator.pop(context);
    }).catchError((error) {
      // Handle the error, e.g., show an error message
      print('Failed to update contact: $error');
    });
  }
}
