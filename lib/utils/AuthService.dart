import 'package:firebase_auth/firebase_auth.dart';
import 'package:water_overflow/models/User.dart' as myUser;

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential res = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return myUser.User.fromFirebase(res.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential res = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return myUser.User.fromFirebase(res.user);
    } on FirebaseAuthException {
      print('The account already exists for that email.');
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<myUser.User> get currentUser {
    return _fAuth.authStateChanges().map(
        (User user) => user != null ? myUser.User.fromFirebase(user) : null);
  }
}
