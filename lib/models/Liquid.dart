import 'package:easy_localization/easy_localization.dart';

class Liquid{
  static final List<String> list = ["water", "soda", "black_tea", "coffee", "green_tea",
  "cola", "beer", "wine", "milk"];

  static List<String> getlist() {
    return list;
  }

  static String getElm(int Index) {
    return list[Index];
  }
}
