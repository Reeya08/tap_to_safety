import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserServices{
  Future addUser(UserModel model) async {
    await FirebaseFirestore.instance.collection('users')
        .add(model.toJson());
  }
}