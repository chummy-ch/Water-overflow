import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:water_overflow/models/UserPresenterModel.dart';
import 'package:water_overflow/screens/DialogScreen.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';
import 'package:water_overflow/widgets/PSettingsButton.dart';

class LogInStep extends StatefulWidget {
  const LogInStep({Key key}) : super(key: key);

  @override
  _LogInStepState createState() => _LogInStepState();
}

class _LogInStepState extends State<LogInStep> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  UserPresenterModel _userModel = UserViewModel.getUserModel();

  void _updateViewModelUserModel() {
    UserViewModel.setUserPresenterModel(_userModel);
    setState(() {});
  }

  void _setGender(bool gender) {
    _userModel.setGender(gender);
    _updateViewModelUserModel();
  }

  String _getGender() {
    if (_userModel.getGender() == true)
      return "SettingsScreen.personalInfo.gender.male".tr();
    else
      return "SettingsScreen.personalInfo.gender.female".tr();
  }

  void _setAge(int age) {
    _userModel.setAge(age);
    _updateViewModelUserModel();
  }

  void _setHeight(int height) {
    _userModel.setHeight(height);
    _updateViewModelUserModel();
  }

  void _setWeight(int weight) {
    _userModel.setWeight(weight);
    _updateViewModelUserModel();
  }

  void _setActivity(double act) {
    _userModel.setActivity(act.round());
    _updateViewModelUserModel();
  }

  int _getAgeFromDate(DateTime time) {
    int days = DateTime.now().difference(time).inDays;
    return (days / 365).round() - 1;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserViewModel.isFirstEntry(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Fill your data'),
                  centerTitle: true,
                ),
                body: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Stepper(
                          type: stepperType,
                          currentStep: _currentStep,
                          onStepTapped: (step) => tapped(step),
                          onStepContinue: continued,
                          steps: <Step>[
                            Step(
                              title: new Text('Gender'),
                              content: PersonalSettingsButton(
                                name:
                                    "SettingsScreen.personalInfo.gender.gender"
                                        .tr(),
                                data: _getGender(),
                                onTap: () => {
                                  Dialogs.showGender(
                                          context, _userModel.getGender())
                                      .then((value) => {
                                            if (value != null) _setGender(value)
                                          })
                                },
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 0
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                            Step(
                              title: new Text('Address'),
                              content: PersonalSettingsButton(
                                name: "SettingsScreen.personalInfo.age".tr(),
                                data: "${_userModel.getAge()}",
                                onTap: () => {
                                  Dialogs.selectDate(context).then((value) => {
                                        if (value != null)
                                          _setAge(_getAgeFromDate(value))
                                      })
                                },
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 1
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                            Step(
                              title: new Text('Mobile Number'),
                              content: PersonalSettingsButton(
                                name:
                                    "SettingsScreen.personalInfo.weight.weight"
                                        .tr(),
                                data: "${_userModel.getWeight()}" +
                                    "SettingsScreen.personalInfo.weight.kg"
                                        .tr(),
                                onTap: () => {
                                  Dialogs.selectWeight(
                                          context, _userModel.getWeight())
                                      .then((value) => {
                                            if (value != null) _setWeight(value)
                                          })
                                },
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 2
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                            Step(
                              title: new Text('Mobile Number'),
                              content: PersonalSettingsButton(
                                name:
                                    "SettingsScreen.personalInfo.height.height"
                                        .tr(),
                                data: "${_userModel.getHeight()}" +
                                    "SettingsScreen.personalInfo.height.cm"
                                        .tr(),
                                onTap: () => {
                                  Dialogs.selectHeight(
                                          context, _userModel.getHeight())
                                      .then((value) => {
                                            if (value != null) _setHeight(value)
                                          })
                                },
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 3
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                            Step(
                              title: new Text('Mobile Number'),
                              content: PersonalSettingsButton(
                                name:
                                    "SettingsScreen.personalInfo.activity.activity"
                                        .tr(),
                                data: ('SettingsScreen.personalInfo.activity.' +
                                        _userModel.getActivity().name)
                                    .tr(),
                                onTap: () => {
                                  Dialogs.showActivityScreen(
                                          context,
                                          _userModel
                                              .getActiveHoursPerWeek()
                                              .toDouble())
                                      .then((value) => {
                                            if (value != null)
                                              _setActivity(value)
                                          })
                                },
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 3
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              Navigator.of(context).pop();
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 4
        ? setState(() => _currentStep += 1)
        : Navigator.of(context).pop();
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
