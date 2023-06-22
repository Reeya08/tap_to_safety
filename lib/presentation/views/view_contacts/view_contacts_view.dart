import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/helpers.dart';
import 'package:tap_to_safety/presentation/elements/view_contacts_tile.dart';
import 'package:tap_to_safety/presentation/views/edit_contacts/edit_contacts_view.dart';
import 'package:tap_to_safety/presentation/views/register_contacts/register_contacts_view.dart';

import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';

class ViewContactsView extends StatefulWidget {
  ViewContactsView({Key? key}) : super(key: key);

  @override
  State<ViewContactsView> createState() => _ViewContactsViewState();
}

class _ViewContactsViewState extends State<ViewContactsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                stream: FirebaseFirestore.instance
                    .collection('contacts')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final contacts = snapshot.data!.docs;

                    // Adding default helplines as contacts
                    // final defaultHelplines = [
                    //   {'name': 'Rescue Helpline', 'phone': '1122'},
                    //   {'name': 'Edhi Ambulance Helpline', 'phone': '115'},
                    //   {'name': 'Rangers Helpline', 'phone': '1101'},
                    //   {'name': 'Police Madadgar Helpline', 'phone': '15'},
                    //   {'name': 'Fire Brigade Helpline', 'phone': '16'},
                    // ];

                    return Column(
                      children: [
                        // for (final helpline in defaultHelplines)
                        //   GestureDetector(
                        //     onTap: () {
                        //
                        //     },
                        //     child: Column(
                        //       children: [
                        //         ViewContactsTile(
                        //           titleText: helpline['name']!,
                        //           subTitleText: helpline['phone']!,
                        //         ),
                        //         const Divider(
                        //           color: AppConstants.primaryColor,
                        //           height: 5,
                        //           indent: 20,
                        //           endIndent: 20,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        for (final contactDoc in contacts)
                          GestureDetector(
                            onTap: () {
                              final contactData =
                              contactDoc.data() as Map<String, dynamic>;
                              final name =
                                  contactData['name'] as String? ?? '';
                              final phone =
                                  contactData['phone'] as String? ?? '';
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
                                ViewContactsTile(
                                  titleText:
                                  contactDoc['name'] as String? ?? '',
                                  subTitleText:
                                  contactDoc['phone'] as String? ?? '',
                                ),
                                const Divider(
                                  color: AppConstants.primaryColor,
                                  height: 5,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ],
                            ),
                          ),
                      ],
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