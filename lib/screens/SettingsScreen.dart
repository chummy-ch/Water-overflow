import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/Block.dart';
import 'package:water_overflow/widgets/PSettingsButton.dart';
import 'package:water_overflow/widgets/PanelButton.dart';
import 'package:water_overflow/widgets/SettingsButton.dart';

import 'MainScreen.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //PanelButton
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  children: [
                    PanelButton(
                      screen: MainScreen(),
                      child: Icon(Icons.arrow_back, size: 24),
                    ),
                  ],
                ),
              ),
              ButtonsBackgroundRectangle(
                height: SizeConfig.blockSizeVertical * 41.7,
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
                            'SettingsScreen.personalInfo.personalInfo'
                                .tr()
                                .toString(),
                            style: TEXT_THEME.headline2,
                          ),
                        ),
                      ],
                    ),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.gender.gender"
                            .tr()
                            .toString(),
                        data: "SettingsScreen.personalInfo.gender.male"
                            .tr()
                            .toString()),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.age".tr(),
                        data: "18"),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.weight.weight"
                            .tr()
                            .toString(),
                        data: "70" +
                            "SettingsScreen.personalInfo.weight.kg"
                                .tr()
                                .toString()),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.height.height"
                            .tr()
                            .toString(),
                        data: "174" +
                            "SettingsScreen.personalInfo.height.cm"
                                .tr()
                                .toString()),
                    PersonalSettingsButton(
                        name: "SettingsScreen.personalInfo.activity.activity"
                            .tr()
                            .toString(),
                        data: "SettingsScreen.personalInfo.activity.low"
                            .tr()
                            .toString()),
                  ],
                ),
              ),
              ButtonsBackgroundRectangle(
                  height: SizeConfig.blockSizeVertical * 35.6,
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
                          name: "SettingsScreen.info.premiumVersion"
                              .tr()
                              .toString()),
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
