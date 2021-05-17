import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';

class DBService {
  final CollectionReference _usersReference =
      FirebaseFirestore.instance.collection('users');

  void saveUserInfo(String userInfo) {
    _updateFirestore("info", userInfo);
  }

  void saveHistory(String date, String history) {
    _updateFirestore(date, history);
  }

  void saveProgress(String date, String progress) {
    _updateFirestore(date, progress);
  }

  void _updateFirestore(String key, String data) async {
    var doc = await _usersReference.doc(UserViewModel.getUserId()).get();
    Map<String, dynamic> m = doc.data();
    m[key] = data;
    _usersReference.doc(UserViewModel.getUserId()).set(m);
  }
}
