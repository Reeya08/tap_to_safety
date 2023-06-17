import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintServices{
  Future <void> submitComplaint(String name, String complaint) async {
    await FirebaseFirestore.instance.collection('complaints').add({
      'name': name,
      'complaint': complaint,
      'timestamp': DateTime.now(),
    });
  }
}