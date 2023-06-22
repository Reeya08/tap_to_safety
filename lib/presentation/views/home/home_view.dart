import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:location/location.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/infrasturcture/services/contacts_services.dart';
import 'package:tap_to_safety/infrasturcture/services/user_services.dart';

import '../../../constants/utils.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // void _sendSMS(String message, List<String> recipents) async {
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }
  void _sendSMS(String message, List<String> recipients) async {
    final LocationData locationData = await Utils.getLocation();
    final locationUrl = await Utils.getLocationUrl(
        locationData.latitude.toString(), locationData.longitude.toString());
    final completeMessage = "$message\nLocation: $locationUrl";

    String _result = await sendSMS(message: completeMessage, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }


  String message = "";

  List<String> recipents = [];

  Future<void> _activateSos() async {
    //to get users current location
    final contactServices = ContactServices();
    final LocationData locationData = await Utils.getLocation();
    final userServices = UserServices();
    // Fetching emergency numbers from Firestore
    final firestoreNumbers = await contactServices.getEmergencyNumbers();
    // Calling all the numbers using FlutterPhoneDirectCaller: Future.wait when we have list of futures
    await Future.wait(
      firestoreNumbers.map((number) =>
          FlutterPhoneDirectCaller.callNumber(firestoreNumbers.first)),
    )
        .then(
            (value) => {_sendSMS("Help me I'm in trouble!!", firestoreNumbers)})
        .then((value) async {
      await userServices.UpdateUser(
          lat: locationData.latitude.toString(),
          lng: locationData.longitude.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: Center(
        child: GestureDetector(
          onTap: () {

            _activateSos();
          },
          child: const CircleAvatar(
            radius: 70,
            backgroundColor: AppConstants.primaryColor,
            child: Text(
              'SOS',
              style: TextStyle(
                fontSize: 28,
                color: AppConstants.whiteBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
