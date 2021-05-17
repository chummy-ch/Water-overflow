import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_overflow/models/UserPresenterModel.dart';

import '../models/User.dart';

//ViewModel uses in the MVVM architecture but we will simplify it
// and use static fields to hold the data
class UserViewModel {
  static UserPresenterModel _userPresenterModel;
  static User _user;
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
  }
}
