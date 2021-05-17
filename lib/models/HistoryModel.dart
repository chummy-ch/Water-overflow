import 'package:easy_localization/easy_localization.dart';

import 'Parcelable.dart';

class HistoryModel extends Parcelable {
  static const STRING_STORE_KEY = "history_model_pref_key";
  static const DOUBLE_PROGRESS_KEY = "progress";

  static String getStoreKeyWithDate() {
    DateTime time = DateTime.now();
    String timeString = DateFormat.yMd().format(time);
    return STRING_STORE_KEY + timeString;
  }

  static String getPogressKeyWithDate() {
    DateTime time = DateTime.now();
    String timeString = DateFormat.yMd().format(time);
    return DOUBLE_PROGRESS_KEY + timeString;
  }

  DateTime time;
  int volume;
  String liquid;

  HistoryModel(DateTime t, int v, String l) {
    time = t;
    volume = v;
    liquid = l;
  }

  @override
  String toString() => "$time?$volume?$liquid";
}
