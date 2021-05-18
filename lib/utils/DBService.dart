import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_overflow/models/Liquid.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';

class DBService {
  final CollectionReference _usersReference =
      FirebaseFirestore.instance.collection('users');
  static const String VERSION_KEY = "version";

  void saveUserInfo(String userInfo) {
    _updateFirestore(UserViewModel.STRING_USER_MODEL_KEY, userInfo);
  }

  void saveHistory(String date, String history) {
    _updateFirestore(date, history);
  }

  Future<void> checkVersion() async {
    var doc = await _usersReference.doc(UserViewModel.getUserId()).get();
    Map<String, dynamic> m = doc.data();
    if (m == null) return;
    if (m.containsKey(VERSION_KEY)) {
      final pref = await SharedPreferences.getInstance();
      var version = pref.getInt(VERSION_KEY);
      if (version == null || version < m[VERSION_KEY]) {
        m.forEach((key, value) {
          if (value is String)
            pref.setString(key, value);
          else if (value is int)
            pref.setDouble(key, value.toDouble());
          else if (value is double) pref.setDouble(key, value.toDouble());
        });
        if (version == null) version = 0;
        version++;
        pref.setInt(VERSION_KEY, version);
      }
    }
  }

  Future<bool> hasFirestoreData() async {
    var doc = await _usersReference.doc(UserViewModel.getUserId()).get();
    Map<String, dynamic> m = doc.data();
    if (m == null) return false;
    return true;
  }

  Future<List<Liquid>> loadLiquid() async {
    var liquidsCollection = FirebaseFirestore.instance.collection("liquids");
    var doc = await liquidsCollection.doc("LuqidsCoef").get();
    Map<String, dynamic> m = doc.data();
    print(m.length);
    List<Liquid> l = [];
    m.forEach((key, value) {
      l.add(Liquid(key, value / 100));
    });
    return l;
  }

  static void removeVersion() async {
    final ref = await SharedPreferences.getInstance();
    ref.setInt(VERSION_KEY, -1);
  }

  void saveProgress(String date, dynamic progress) {
    _updateFirestore(date, progress);
  }

  void _updateFirestore(String key, String data) async {
    var doc = await _usersReference.doc(UserViewModel.getUserId()).get();
    Map<String, dynamic> m = doc.data();
    m[key] = data;
    int version = 0;
    if (m.containsKey(VERSION_KEY)) {
      version = m[VERSION_KEY];
      version++;
    }
    m[VERSION_KEY] = version;
    _usersReference.doc(UserViewModel.getUserId()).set(m);
  }
}
