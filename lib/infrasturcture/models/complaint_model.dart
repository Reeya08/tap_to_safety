// To parse this JSON data, do
//
//     final complaintModel = complaintModelFromJson(jsonString);

import 'dart:convert';

ComplaintModel complaintModelFromJson(String str) => ComplaintModel.fromJson(json.decode(str));

String complaintModelToJson(ComplaintModel data) => json.encode(data.toJson());

class ComplaintModel {
  String? name;
  String? complaint;
  String? timestamp;

  ComplaintModel({
    this.name,
    this.complaint,
    this.timestamp,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
    name: json["name"],
    complaint: json["complaint"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "complaint": complaint,
    "timestamp": timestamp,
  };
}
