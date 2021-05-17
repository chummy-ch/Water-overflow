class UserPresenterModel {
  static const USER_MODEL_KEY = "user_model";

  bool _gender;
  int _age;
  int _weight;
  int _height;
  Activity _activity;

  UserPresenterModel(
      bool gender, int age, int weight, int height, Activity activity) {
    _gender = gender;
    _age = age;
    _weight = weight;
    _height = height;
    _activity = activity;
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
    return _activity;
  }
}

//Enum class to display user activity
enum Activity { few, normal, enough, much }
