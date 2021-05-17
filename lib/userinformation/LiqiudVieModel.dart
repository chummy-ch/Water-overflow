import 'package:water_overflow/models/Liquid.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';

class LiquidViewModel {
  static List<Liquid> _liquidList;

  static void setLiquid(List<Liquid> l) {
    _liquidList = l;
  }

  static List<Liquid> getLiquidList() {
    if (_liquidList == null) {
      UserViewModel.db.loadLiquid().then((value) {
        _liquidList = value;
        print(value.length);
      });
    }
    return _liquidList;
  }
}
