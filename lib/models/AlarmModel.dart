import 'package:water_overflow/models/Parcelable.dart';

class AlarmModel implements Parcelable{
    String time;
    bool isON;

    AlarmModel(String t, bool isON){
      this.time = t;
      this.isON = isON;
    }

    @override
  String toString() {
      return "$time?$isON";
    }

}