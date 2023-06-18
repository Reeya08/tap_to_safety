import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  Future<UserCredential> loginUser(
      {required String email, required String password}) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(
      {required String email, required String password}){
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendPasswordResetEmail({required String email}) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
