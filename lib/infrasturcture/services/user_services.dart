import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserServices{
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("userCollection");
  Future addUser(UserModel model) async {
    DocumentReference ref = userCollection.doc(model.uid);
    return await ref.set({
      'uid': model.uid,
      'name': model.fullName,
      'email': model.email,
      'phone': model.phone,
      'lat': model.lat,
      'lng': model.lng,
      'currentLatLngTime': model.currentLatLngTime,
    });
  }


}