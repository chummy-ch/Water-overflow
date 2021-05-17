import 'Parcelable.dart';

class HistoryModel extends Parcelable {
  static const STRING_STORE_KEY = "history_model_pref_key";
  static const DOUBLE_PROGRESS_KEY = "progress";

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
