import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';

class DBService {
  final CollectionReference _usersReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> addOrUpdateUser() async {
    return await _usersReference
        .doc(UserViewModel.getUserId())
        .set({});
  }
}
