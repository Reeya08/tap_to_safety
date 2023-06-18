// To parse this JSON data, do
//
//     final complaintModel = complaintModelFromJson(jsonString);

import 'dart:convert';

ComplaintModel complaintModelFromJson(String str) => ComplaintModel.fromJson(json.decode(str));

String complaintModelToJson(ComplaintModel data) => json.encode(data.toJson());

class ComplaintModel {
  String? name;
  String? complaint;
  DateTime? date;

  ComplaintModel({
    this.name,
    this.complaint,
    this.date,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
    name: json["name"],
    complaint: json["complaint"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "complaint": complaint,
    "date": date,
  };
}
