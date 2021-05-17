import 'package:water_overflow/models/UserPresenterModel.dart';

import '../models/User.dart';

//ViewModel uses in the MVVM architecture but we will simplify it
// and use static fields to hold the data
class UserViewModel {
  static UserPresenterModel _userPresenterModel;
  static User _user;

  static String getUserId() {
    return _user.id;
  }

  static UserPresenterModel getUserModel() {
    if (_userPresenterModel != null)
    return _userPresenterModel;
    else return UserPresenterModel(true, 18, 65, 175, 10);
  }

  static setUserPresenterModel(UserPresenterModel user) {
    _userPresenterModel = user;
  }

  static setUser(User user) {
    _user = user;
  }
}
