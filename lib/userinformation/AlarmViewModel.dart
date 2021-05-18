import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_overflow/models/AlarmModel.dart';

class AlarmViewModel {
  static List<AlarmModel> _alarms = [AlarmModel("8:00", false)];
  static String STRING_ALARM_KEY = "alarms";

  static getAlarms() {
    return _alarms;
  }

  static Future<List<AlarmModel>> loadAlarms() async {
    final pref = await SharedPreferences.getInstance();
    String st = pref.getString(STRING_ALARM_KEY);
    if (st != null && st.length > 2) _alarms = toList(st);
    return _alarms;
  }

  static List<AlarmModel> toList(String st) {
    var arr = st.split(",");
    List<AlarmModel> list = [];
    arr.forEach((element) {
      var ar = element.split("?");
      AlarmModel model = AlarmModel(ar[0], ar[1] == "true");
      list.add(model);
    });
    return list;
  }

  static Future<void> setAlarms(List<AlarmModel> alarms) async {
    _alarms = alarms;
    final pref = await SharedPreferences.getInstance();
    await pref.setString(STRING_ALARM_KEY, getString());
  }

  static String getString(){
    String st = "";
    for (int i = 0; i < _alarms.length; i++) {
      st += _alarms[i].toString();
      if (i != _alarms.length - 1) st += ',';
    }
    return st;
  }
}
