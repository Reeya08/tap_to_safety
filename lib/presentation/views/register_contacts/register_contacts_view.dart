import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/app_constants.dart';
import '../../elements/custom_button.dart';
import '../../elements/custom_text_field.dart';

class RegisterContactsView extends StatefulWidget {
  RegisterContactsView({Key? key}) : super(key: key);

  @override
  State<RegisterContactsView> createState() => _RegisterContactsViewState();
}

class _RegisterContactsViewState extends State<RegisterContactsView> {
  final TextEditingController name_controller = TextEditingController();

  final TextEditingController phone_controller = TextEditingController();
  // List<Contact> contacts = [];
  //
  // bool isLoading = true;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getContactPermission();
  // }
  //
  // void getContactPermission() async {
  //   if (await Permission.contacts.isGranted) {
  //     fetchContacts();
  //   } else {
  //     await Permission.contacts.request();
  //   }
  // }
  //
  // void fetchContacts() async {
  //   contacts = await ContactsService.getContacts();
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/register_contacts.jpeg',
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomTextField(
              textInputType: TextInputType.name,
              obscureText: false,
              controller: name_controller,
              ImagePath: 'assets/images/name.png',
              LabelText: 'Name', isPasswordField: false,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textInputType: TextInputType.phone,
              controller: phone_controller,
              ImagePath: 'assets/images/phone.png',
              LabelText: 'Phone', isPasswordField: false,
            ),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              childText: 'Add Contact',
              height: 60,
              width: 230,
              textSize: 20,
              onPressed: () {
                },
            ),
          ],
        ),
      ),
    );
  }
}
