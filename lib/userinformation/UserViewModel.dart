import 'package:water_overflow/models/UserPresenterModel.dart';

import '../models/User.dart';

class UserViewModel {
  static UserPresenterModel _userPresenterModel;
  static User _user;

  static String getUserId() {
    return _user.id;
  }

  static UserPresenterModel getUserModel() {
    return _userPresenterModel;
  }
}
