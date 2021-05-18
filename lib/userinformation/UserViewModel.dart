import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_overflow/models/HistoryModel.dart';
import 'package:water_overflow/models/UserPresenterModel.dart';
import 'package:water_overflow/utils/DBService.dart';

import '../models/User.dart';

class UserViewModel {
  static DBService db = DBService();
  static UserPresenterModel _userPresenterModel;
  static User _user;
  static double _progress;
  static List<HistoryModel> _history;
  static const STRING_USER_MODEL_KEY = "user_model";

  static String getUserId() {
    return _user.id;
  }

  static UserPresenterModel getUserModel() {
    if (_userPresenterModel != null)
      return _userPresenterModel;
    else
      return UserPresenterModel(true, 18, 65, 175, 10);
  }

  static setUserPresenterModel(UserPresenterModel user) {
    _userPresenterModel = user;
    _saveUserModel();
  }

  static Future<List<HistoryModel>> getHistory() async {
    if (_history == null) {
      _history = [];
      await _loadHistoryInfo();
      return _history;
    }
    return _history;
  }

  static Future<void> _loadHistoryInfo() async {
    final pref = await SharedPreferences.getInstance();
    String history = pref.getString(HistoryModel.getStoreKeyWithDate());
    if (history == null || history.length == 0) {
      //TODO set default values
    } else {
      List<String> stringList = history.split(',');
      _history = [];
      for (int i = 0; i < stringList.length; i++) {
        var historyModel = getHistoryFromString(stringList[i]);
        _history.add(historyModel);
      }
    }
  }

  //if false then this is not the first entry
  static Future<bool> isFirstEntry() async {
    final ref = await SharedPreferences.getInstance();
    var version = ref.getInt(DBService.VERSION_KEY);
    if (version != null) return false;
    var hasFirestoreData = await DBService().hasFirestoreData();
    return !hasFirestoreData;
  }

  static HistoryModel getHistoryFromString(String h) {
    String s = h.replaceAll("[", "").replaceAll("]", "");
    List<String> valuesList = s.split('?');
    DateTime time = DateTime.parse(valuesList[0]);
    int volume = int.parse(valuesList[1]);
    String liquid = valuesList[2];
    return HistoryModel(time, volume, liquid);
  }

  static Future<double> getProgress() async {
    if (_progress == null) {
      await _loadProgress();
      return _progress;
    }
    return _progress;
  }

  static Future<void> _loadProgress() async {
    final pref = await SharedPreferences.getInstance();
    double progress = pref.getDouble(HistoryModel.getPogressKeyWithDate());
    if (progress == null || progress < 0)
      _progress = 0;
    else
      _progress = progress;
  }

  static setHistory(List<HistoryModel> history) {
    _history = history;
    _saveHistory();
  }

  static String getStringFromHistoryList() {
    String st = "";
    for (int i = 0; i < _history.length; i++) {
      st += "[${_history[i].toString()}]";
      if (i != _history.length - 1) st += ",";
    }
    return st;
  }

  static _saveHistory() async {
    final pref = await SharedPreferences.getInstance();
    var st = getStringFromHistoryList();
    pref.setString(HistoryModel.getStoreKeyWithDate(), st);
    //db.saveHistory(HistoryModel.getStoreKeyWithDate(), st);
  }

  static setProgress(double p) {
    _progress = p;
    //_saveProgress(p);
    saveHistoryAndProgressToFirestore();
  }

  static saveHistoryAndProgressToFirestore() async {
    var db = DBService();
    var st = getStringFromHistoryList();
    await db.updateFirestore(HistoryModel.getStoreKeyWithDate(), st).then(
        (value) => db.updateFirestore(
            HistoryModel.getPogressKeyWithDate(), _progress));
  }

  static _saveProgress(double v) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(HistoryModel.getPogressKeyWithDate(), v);
    db.saveProgress(HistoryModel.getPogressKeyWithDate(), v);
  }

  static setUser(User user) {
    _user = user;
  }

  static Future<List<double>> getWeekProgress() async {
    final pref = await SharedPreferences.getInstance();
    var timeNow = DateTime.now();
    List<double> progressList = [];
    for (int i = 0; i < 7; i++) {
      var time = timeNow.subtract(new Duration(days: i));
      print(DateFormat.yMd().format(time));
      String key =
          HistoryModel.DOUBLE_PROGRESS_KEY + DateFormat.yMd().format(time);
      var progress = pref.getDouble(key);
      if (progress == null || progress < 0) return progressList;
      progressList.add(progress);
    }
    return progressList;
  }

  static Future<void> loadUserModel() async {
    final pref = await SharedPreferences.getInstance();
    String string = pref.getString(STRING_USER_MODEL_KEY);
    if (string != null) {
      List<String> stringList = string.split("?");
      UserPresenterModel model = UserPresenterModel(
          stringList[0] == "true",
          int.parse(stringList[1]),
          int.parse(stringList[2]),
          int.parse(stringList[3]),
          int.parse(stringList[4]));
      _userPresenterModel = model;
    }
  }

  static void _saveUserModel() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(STRING_USER_MODEL_KEY, _userPresenterModel.toString());
    db.saveUserInfo(_userPresenterModel.toString());
  }
}
