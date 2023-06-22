import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/infrasturcture/services/contacts_services.dart';
import 'package:tap_to_safety/presentation/elements/custom_dialog.dart';

import '../../../constants/app_constants.dart';
import '../../elements/custom_button.dart';
import '../../elements/custom_text_field.dart';
import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';

class RegisterContactsView extends StatefulWidget {
  RegisterContactsView({Key? key}) : super(key: key);

  @override
  State<RegisterContactsView> createState() => _RegisterContactsViewState();
}

class _RegisterContactsViewState extends State<RegisterContactsView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> getContactPermissionAndSave() async {
    if (await Permission.contacts.isGranted) {
      await saveContact();
    } else {
      var status = await Permission.contacts.request();
      if (status.isGranted) {
        await saveContact();
      }
    }
  }

  Future<void> saveContact() async {
    var contact = Contact(
      displayName: nameController.text,
      phones: [Item(value: phoneController.text)],
    );
    await ContactServices().addContactToFirestore(contact);
  }

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
          leading: GestureDetector(
            onTap: () {
              NavigationHelper.push(const BottomNavigationView(), context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppConstants.primaryColor,
            ),
          ),
        ),
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
                controller: nameController,
                ImagePath: 'assets/images/name.png',
                LabelText: 'Name',
                isPasswordField: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                textInputType: TextInputType.phone,
                controller: phoneController,
                ImagePath: 'assets/images/phone.png',
                LabelText: 'Phone',
                isPasswordField: false,
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
                    setLoadingTrue();
                    getContactPermissionAndSave().then((value) {
                      setLoadingFalse();
                      showDialog(
                          context: context,
                          builder: (context) {
                            nameController.clear();
                            phoneController.clear();
                            FocusManager.instance.primaryFocus!.unfocus();
                            return CustomDialog(
                                messageContent: 'Contact Added Successfully!',
                                onPressed: () {
                                  Navigator.pop(context);
                                });
                          }).onError((error, stackTrace) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              nameController.clear();
                              phoneController.clear();
                              return CustomDialog(messageContent: error.toString(), onPressed: (){ Navigator.pop(context);});
                            });
                      });
                    });
                  }),
            ],
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
