import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/custom_button.dart';
import 'package:tap_to_safety/presentation/elements/view_contacts_tile.dart';
import 'package:tap_to_safety/presentation/views/edit_contacts/edit_contacts_view.dart';
import 'package:tap_to_safety/presentation/views/register_contacts/register_contacts_view.dart';

class ViewContactsView extends StatelessWidget {
  const ViewContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: AppConstants.primaryColor,
        ),
      ),
      backgroundColor: AppConstants.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/view_contacts.jpeg'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      NavigationHelper.push(RegisterContactsView(), context);
                    },
                    child: Image.asset('assets/images/add.png'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('contacts').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final contacts = snapshot.data!.docs;
                    return Column(
                      children: contacts.map((contactDoc) {
                        final contactData = contactDoc.data() as Map<String, dynamic>;
                        final name = contactData['name'] ?? '';
                        final phone = contactData['phone'] ?? '';
                        return GestureDetector(
                          onTap: () {
                            NavigationHelper.push(
                              EditContactsView(
                                name: name,
                                phone: phone,
                                contactId: contactDoc.id,
                              ),
                              context,
                            );
                          },
                          child: Column(
                            children: [
                              ViewContactsTile(titleText: name, subTitleText: phone),
                              const Divider(
                                color: AppConstants.primaryColor,
                                height: 5,
                                indent: 20,
                                endIndent: 20,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
