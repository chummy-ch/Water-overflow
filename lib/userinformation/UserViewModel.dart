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
        String s = stringList[i].replaceAll("[", "").replaceAll("]", "");
        List<String> valuesList = s.split('?');
        DateTime time = DateTime.parse(valuesList[0]);
        int volume = int.parse(valuesList[1]);
        String liquid = valuesList[2];
        _history.add(HistoryModel(time, volume, liquid));
      }
    }
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
    if (progress >= 0)
      _progress = progress;
    else
      _progress = 0;
  }

  static setHistory(List<HistoryModel> history) {
    _history = history;
    _saveHistory();
  }

  static _saveHistory() async {
    final pref = await SharedPreferences.getInstance();
    String st = "";
    for (int i = 0; i < _history.length; i++) {
      st += "[${_history[i].toString()}]";
      if (i != _history.length - 1) st += ",";
    }
    pref.setString(HistoryModel.getStoreKeyWithDate(), st);
    db.saveHistory(HistoryModel.getStoreKeyWithDate(), st);
  }

  static setProgress(double p) {
    _progress = p;
    _saveProgress(p);
  }

  static _saveProgress(double v) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(HistoryModel.getPogressKeyWithDate(), v);
    db.saveProgress(HistoryModel.getPogressKeyWithDate(), v.toString());
  }

  static setUser(User user) {
    _user = user;
  }

  static Future<void> loadUserModel() async {
    final pref = await SharedPreferences.getInstance();
    String string = pref.getString(STRING_USER_MODEL_KEY);
    List<String> stringList = string.split("?");
    UserPresenterModel model = UserPresenterModel(
        stringList[0] == "true",
        int.parse(stringList[1]),
        int.parse(stringList[2]),
        int.parse(stringList[3]),
        int.parse(stringList[4]));
    _userPresenterModel = model;
  }

  static void _saveUserModel() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(STRING_USER_MODEL_KEY, _userPresenterModel.toString());
    db.saveUserInfo(_userPresenterModel.toString());
  }
}
