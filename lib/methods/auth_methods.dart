import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';

class AuthMethods {
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = "Some Error Occured";
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      result = "Success";
    } on FirebaseAuthException catch (e) {
      result = e.message.toString();
    }
    return result;
  }

  Future<String> signUpUser({
    required String UserName,
    required String email,
    required String password,
  }) async {
    String result = "Somce Error Occured";
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      result = "Success";
    } on FirebaseAuthException catch (e) {
      result = e.message.toString();
    }
    return result;
  }
}
