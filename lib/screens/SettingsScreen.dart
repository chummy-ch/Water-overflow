import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/models/UserPresenterModel.dart';
import 'package:water_overflow/screens/DialogScreen.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';
import 'package:water_overflow/utils/AuthService.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/utils/DBService.dart';
import 'package:water_overflow/widgets/Block.dart';
import 'package:water_overflow/widgets/PSettingsButton.dart';
import 'package:water_overflow/widgets/PanelButton.dart';
import 'package:water_overflow/widgets/SettingsButton.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsScreen();
}

class SettingsScreen extends State<Settings> {
  UserPresenterModel _userModel = UserViewModel.getUserModel();

  void _setActivity(double act) {
    _userModel.setActivity(act.round());
    _updateViewModelUserModel();
  }

  void _updateViewModelUserModel() {
    UserViewModel.setUserPresenterModel(_userModel);
    setState(() {});
  }

  void _setHeight(int height) {
    _userModel.setHeight(height);
    _updateViewModelUserModel();
  }

  void _setWeight(int weight) {
    _userModel.setWeight(weight);
    _updateViewModelUserModel();
  }

  int _getAgeFromDate(DateTime time) {
    int days = DateTime.now().difference(time).inDays;
    return (days / 365).round() - 1;
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

  void _setGender(bool gender) {
    _userModel.setGender(gender);
    _updateViewModelUserModel();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    UserPresenterModel model;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4.7),
            scrollDirection: Axis.vertical,
            children: [
              //PanelButton
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  children: [
                    PanelButton(
                      tap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Icon(Icons.arrow_back, size: 24),
                    ),
                  ],
                ),
              ),
              ButtonsBackgroundRectangle(
                height: SizeConfig.blockSizeVertical * 60.7,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 4.9,
                              top: SizeConfig.blockSizeVertical * 2.5,
                              bottom: SizeConfig.blockSizeVertical * 2),
                          child: Text(
                            'SettingsScreen.personalInfo.personalInfo'.tr(),
                            style: TEXT_THEME.headline2,
                          ),
                        ),
                      ],
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.gender.gender".tr(),
                      data: _getGender(),
                      onTap: () => {
                        Dialogs.showGender(context, _userModel.getGender())
                            .then((value) =>
                                {if (value != null) _setGender(value)})
                      },
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.age".tr(),
                      data: "${_userModel.getAge()}",
                      onTap: () => {
                        Dialogs.selectDate(context).then((value) => {
                              if (value != null) _setAge(_getAgeFromDate(value))
                            })
                      },
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.weight.weight".tr(),
                      data: "${_userModel.getWeight()}" +
                          "SettingsScreen.personalInfo.weight.kg".tr(),
                      onTap: () => {
                        Dialogs.selectWeight(context, _userModel.getWeight())
                            .then((value) =>
                                {if (value != null) _setWeight(value)})
                      },
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.height.height".tr(),
                      data: "${_userModel.getHeight()}" +
                          "SettingsScreen.personalInfo.height.cm".tr(),
                      onTap: () => {
                        Dialogs.selectHeight(context, _userModel.getHeight())
                            .then((value) =>
                                {if (value != null) _setHeight(value)})
                      },
                    ),
                    PersonalSettingsButton(
                      name:
                          "SettingsScreen.personalInfo.activity.activity".tr(),
                      data: ('SettingsScreen.personalInfo.activity.' +
                              _userModel.getActivity().name)
                          .tr(),
                      onTap: () => {
                        Dialogs.showActivityScreen(context,
                                _userModel.getActiveHoursPerWeek().toDouble())
                            .then((value) =>
                                {if (value != null) _setActivity(value)})
                      },
                    ),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.language.language"
                            .tr(),
                        data: EasyLocalization.of(context)
                            .currentLocale
                            .toString()
                            .tr(),
                        onTap: () => {
                              Dialogs.showLanguage(context, true).then(
                                  (value) => {
                                        if (value != null)
                                          context.setLocale(
                                              Locale(value ? 'en' : 'ru'))
                                      })
                            }),
                    PersonalSettingsButton(
                        name:
                            "SettingsScreen.personalInfo.account.account".tr(),
                        data: "SettingsScreen.personalInfo.account.leave".tr(),
                        onTap: () => {
                              Dialogs.showExitScreenAndExit(context).then(
                                (value) {
                                  if (value) {
                                    DBService.removeVersion();
                                    AuthService().logOut();
                                    Navigator.pop(context);
                                  }
                                },
                              )
                            }),
                  ],
                ),
              ),
              ButtonsBackgroundRectangle(
                  height: SizeConfig.blockSizeVertical * 39,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 4.9,
                                top: SizeConfig.blockSizeVertical * 2.5,
                                bottom: SizeConfig.blockSizeVertical * 2),
                            child: Text(
                              'SettingsScreen.info.info'.tr(),
                              style: TEXT_THEME.headline2,
                            ),
                          ),
                        ],
                      ),
                      SettingsButton(
                          name: "SettingsScreen.info.premiumVersion".tr()),
                      SettingsButton(name: "SettingsScreen.info.about".tr()),
                      SettingsButton(name: "SettingsScreen.info.contact".tr()),
                      SettingsButton(name: "SettingsScreen.info.private".tr()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
