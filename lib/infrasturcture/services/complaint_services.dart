import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tap_to_safety/infrasturcture/models/complaint_model.dart';
class ComplaintServices{
  Future submitComplaint(ComplaintModel model) async {
    await FirebaseFirestore.instance.collection('complaints')
        .add(model.toJson());
  }
}
