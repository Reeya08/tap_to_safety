import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
static Location location = Location();
  static showSnakBar(BuildContext context,
      {required String message, required Color color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }
  static Future<LocationData> getLocation() async {
    return await location.getLocation();
  }
static Future<String> getLocationUrl(
    String latitude, String longitude) async {
  String mapUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunch(mapUrl)) {
    return mapUrl;
  } else {
    throw 'Could not launch $mapUrl';
  }
}
}

