import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<User?> signIn({required String email, required String password}) async {
    User? user;
    try {
      UserCredential userCredential =  await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      debugPrint("unknown");
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "unknown Error");
    }
    return user;
  }

  Future<bool> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    debugPrint("unknown");
    return true;
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  String cekId() {
    final user = _firebaseAuth.currentUser;
    return user.toString();
  }

//   Future<bool> signUp({required String email, required String password}) async {
//   try {
//     await _firebaseAuth.createUserWithEmailAndPassword(
//       email: email, password: password);
//     debugPrint("Signup successful");
//     return true;
//   } catch (e) {
//     debugPrint("Signup failed: $e");
//     return false;
//   }
// }
}