import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class UserServices {
  // Future addUser(UserModel model) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(model.uid.toString())
  //       .set(model.toJson());
  // }
  Future<void> addUser(UserModel model) async {
    final uid = model.uid.toString();

    if (uid.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(model.toJson());
    } else {
      throw Exception("Invalid uid");
    }
  }


  Stream<UserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('uid', isEqualTo: userID)
        .snapshots()
        .map(
            (userData) => UserModel.fromJson(userData as Map<String, dynamic>));
  }

  Future UpdateUser({required String lat, required String lng}) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "lat": lat,
      "lng": lng,
    });
  }
}
