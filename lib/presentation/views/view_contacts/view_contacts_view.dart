import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/custom_text.dart';
import 'package:tap_to_safety/presentation/elements/view_contacts_tile.dart';
import 'package:tap_to_safety/presentation/views/edit_contacts/edit_contacts_view.dart';
import 'package:tap_to_safety/presentation/views/register_contacts/register_contacts_view.dart';

class ViewContactsView extends StatelessWidget {
  const ViewContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Column(
            children: [
               const SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/view-contacts-pic.png'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                     onTap: (){
                       NavigationHelper.push(const RegisterContactView(), context);
                     },
                      child: Image.asset('assets/images/add.png')),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const ViewContactsTile(titleText: 'Reeya', subTitleText: '033343453221'),
              const Divider(
                color: AppConstants.primaryColor,
                height: 5,
                indent: 20,
                endIndent: 20,
              ),
              const ViewContactsTile(titleText: 'Vaneeza', subTitleText: '033343453221'),
              const Divider(
                color: AppConstants.primaryColor,
                height: 5,
                indent: 20,
                endIndent: 20,
              ),
              const ViewContactsTile(titleText: 'Iqra', subTitleText: '033343453221'),
              const Divider(
                color: AppConstants.primaryColor,
                height: 5,
                indent: 20,
                endIndent: 20,
              ),
              const ViewContactsTile(titleText: 'Alia', subTitleText: '033343453221'),
              const Divider(
                color: AppConstants.primaryColor,
                height: 5,
                indent: 20,
                endIndent: 20,
              ),
              const ViewContactsTile(titleText: 'Aina', subTitleText: '033343453221'),
              const Divider(
                color: AppConstants.primaryColor,
                height: 5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      childText: 'Edit Contacts',
                      height: 60,
                      width: 150,
                      textSize: 16,
                      onPressed: ()
                      {
                        NavigationHelper.push(EditContactsView(), context);
                      }),
                  const SizedBox(width: 20,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


