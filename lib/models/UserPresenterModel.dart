class UserPresenterModel {
  bool _gender;
  int _age;
  int _weight;
  int _height;
  int _activeHoursPerWeek;
  static const int MIN_AGE_OF_USER = 16;
  static const int MAX_AGE_OF_USER = 100;

  static const int MIN_WEIGHT_OF_USER = 20;
  static const int MAX_WEIGHT_OF_USER = 200;

  static const int MIN_HEIGHT_OF_USER = 100;
  static const int MAX_HEIGHT_OF_USER = 220;

  UserPresenterModel(
      bool gender, int age, int weight, int height, int activeHoursPerWeek) {
    _gender = gender;
    _age = age;
    _weight = weight;
    _height = height;
    _activeHoursPerWeek = activeHoursPerWeek;
  }

  int getAge() {
    return _age;
  }

  int getWeight() {
    return _weight;
  }

  int getHeight() {
    return _height;
  }

  bool getGender() {
    return _gender;
  }

  Activity getActivity() {
    if (_activeHoursPerWeek < 5) {
      return Activity.few;
    } else if (_activeHoursPerWeek < 10) {
      return Activity.normal;
    } else if (_activeHoursPerWeek < 20) {
      return Activity.enough;
    } else {
      return Activity.much;
    }
  }

  bool isCompleteDataFiling() {
    return _gender != null && _age != 0 && _weight != 0 && _height != 0;
  }
}

//Enum class to display user activity
enum Activity { few, normal, enough, much }
