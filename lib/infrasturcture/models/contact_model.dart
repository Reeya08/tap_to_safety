// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  String? name;
  String? phone;

  ContactModel({
    this.name,
    this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
  };
}
