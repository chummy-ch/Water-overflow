import 'package:firebase_auth/firebase_auth.dart' as firebase;

class User {
  String id;

  User.fromFirebase(firebase.User user) {
    id = user.uid;
  }
}
