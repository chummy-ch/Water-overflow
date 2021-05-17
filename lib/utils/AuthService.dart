import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential res = await _fAuth.signInWithCredential(credential);
    // Once signed in, return the UserCredential
    return myUser.User.fromFirebase(res.user);
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<myUser.User> get currentUser {
    return _fAuth.authStateChanges().map(
        (User user) => user != null ? myUser.User.fromFirebase(user) : null);
  }
}
