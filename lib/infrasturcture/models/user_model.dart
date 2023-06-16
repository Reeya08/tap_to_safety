// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.uid.toString()));

  class UserModel {
  String? uid;
  String? fullName;
  String? email;
  String? phone;
  String? lat;
  String? lng;
  String? currentLatLngTime;

  UserModel({
    this.uid,
    this.fullName,
    this.email,
    this.phone,
    this.lat,
    this.lng,
    this.currentLatLngTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        lat: json["lat"],
        lng: json["lng"],
        currentLatLngTime: json["currentLatLngTime"],
      );
  Map<String, dynamic> toJson(String id) => {
        "uid": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "currentLatLngTime": currentLatLngTime,
      };
}
