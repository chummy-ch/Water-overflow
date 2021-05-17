import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/screens/DialogScreen.dart';
import 'package:water_overflow/utils/AuthService.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/Block.dart';
import 'package:water_overflow/widgets/PSettingsButton.dart';
import 'package:water_overflow/widgets/PanelButton.dart';
import 'package:water_overflow/widgets/SettingsButton.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
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
                      data: "SettingsScreen.personalInfo.gender.male".tr(),
                      onTap: () => {
                        Dialogs.showGender(context,  true)
                            .then((value) => {if (value != null) print(value)})//TODO: add current value and localization
                      }
                        ,
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.age".tr(),
                      data: "18",
                      onTap: () => {
                        Dialogs.selectDate(context)
                            .then((value) => {if (value != null) print(value)})
                      },
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.weight.weight".tr(),
                      data: "70" + "SettingsScreen.personalInfo.weight.kg".tr(),
                      onTap: () => {
                        Dialogs.selectWeight(context)
                            .then((value) => {if (value != null) print(value)})
                      },
                    ),
                    PersonalSettingsButton(
                      name: "SettingsScreen.personalInfo.height.height".tr(),
                      data:
                          "174" + "SettingsScreen.personalInfo.height.cm".tr(),
                      onTap: () => {
                        Dialogs.selectHeight(context) //TODO: add current value and localization
                            .then((value) => {if (value != null) print(value)})
                      },
                    ),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.activity.activity"
                            .tr(),
                        data: "SettingsScreen.personalInfo.activity.low".tr(),
                      onTap: () => {
                        Dialogs.showActivityScreen(context, 5) //TODO: add current value and localization
                            .then((value) => {if (value != null) print(value)})
                      },
                    ),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.language.language"
                            .tr(),
                        data: "SettingsScreen.personalInfo.language.en".tr(),
                        onTap: () => {
                              Dialogs.showLanguage(
                                      context, true)
                                  .then((value) =>
                                      {if (value != null) context.setLocale(Locale(value ? 'en' : 'ru'))})
                            }), //TODO: add current value and localization
                    PersonalSettingsButton(
                        name:
                            "SettingsScreen.personalInfo.account.account".tr(),
                        data: "SettingsScreen.personalInfo.account.leave".tr(),
                        onTap: () => {
                              Dialogs.showExitScreenAndExit(context).then(
                                (value) => {
                                  if (value)
                                    {
                                      AuthService().logOut(),
                                      Navigator.pop(context)
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
