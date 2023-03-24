import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text_field.dart';
import 'package:tap_to_safety/presentation/views/view_contacts/view_contacts_view.dart';
class EditContactsView extends StatelessWidget {
  const EditContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Center(child: Image.asset('assets/images/edit-contact.png',height: 300,width: 300,)),
          const SizedBox(height: 40,),
          const CustomTextField(ImagePath: 'assets/images/name.png', LabelText: 'Name',),
          const SizedBox(height: 40,),
          const CustomTextField(ImagePath: 'assets/images/phone.png', LabelText: 'Phone',),
          const SizedBox(height: 120,),
          CustomButton(childText: 'Save', height: 60, width: 150, onPressed: (){
            NavigationHelper.push(const ViewContactsView(), context);
          },),
        ],
      ),
    );
  }
}
