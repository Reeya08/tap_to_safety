import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {

  Future<UserCredential> loginUser(
      {required String email, required String password}) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendPasswordResetEmail({required String email}) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  // Future<UserCredential> loginUserWithProvider(
  //     {required String provider, required String email, required String password}) {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   switch (provider) {
  //     case 'google':
  //       final GoogleAuthProvider googleProvider = GoogleAuthProvider();
  //       return _auth.signInWithPopup(googleProvider);
  //   // Add more cases for other providers if needed
  //     default:
  //       throw Exception('Unsupported provider');
  //   }
  // }
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
