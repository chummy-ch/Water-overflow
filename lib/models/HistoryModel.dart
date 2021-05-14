class HistoryModel {
  DateTime time;
  int volume;
  String liquid;

  HistoryModel(DateTime t, int v, String l) {
    time = t;
    volume = v;
    liquid = l;
  }
}