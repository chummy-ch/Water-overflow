import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/screens/StatisticsScreen.dart';
import 'package:water_overflow/utils/AuthService.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/AppIcons.dart';
import 'package:water_overflow/widgets/Block.dart';
import 'package:water_overflow/widgets/HistoryButton.dart';
import 'package:water_overflow/widgets/LiquidButton.dart';
import 'package:water_overflow/widgets/PanelButton.dart';

import 'AlarmScreen.dart';
import 'SettingsScreen.dart';

class MainScreen extends StatelessWidget {
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
              //PanelButtons
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //////////TODO: DELETE
                    ElevatedButton(
                      onPressed: () {
                        AuthService().logOut();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLOR_BLUE_WHITE,
                        shadowColor: COLOR_BLACK,
                        onPrimary: COLOR_BUTTON,
                      ),
                      child: Icon(
                        Icons.close,
                        color: COLOR_BLACK,
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      screen: SettingsScreen(),
                      child: Icon(AppIcons.settings, size: 24),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      screen: StatisticsScreen(),
                      child: Icon(AppIcons.statistics, size: 24),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      screen: AlarmScreen(),
                      child: Icon(AppIcons.notification, size: 24),
                    ),
                  ],
                ),
              ),

              //Water Circle
              Container(
                  width: SizeConfig.blockSizeHorizontal * 68.3,
                  height: SizeConfig.blockSizeVertical * 35.5,
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(126, 214, 234, 1.0),
                        COLOR_WHITE,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '50%',
                        style: TEXT_THEME.headline1,
                      ),
                      Text(
                        '1100/2200' + 'MainScreen.ml'.tr().toString(),
                        style: TEXT_THEME.headline2,
                      ),
                    ],
                  )),

              //liquid Block
              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.2),
                child: ButtonsBackgroundRectangle(
                  height: SizeConfig.blockSizeVertical * 13.17,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Icon(AppIcons.plus, size: 40),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.coffee_cup, size: 45),
                              Text('120 ' + 'MainScreen.ml'.tr().toString(),
                                  style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.glass, size: 40),
                              Text('240 ' + 'MainScreen.ml'.tr().toString(),
                                  style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.coffee_glass, size: 45),
                              Text('340 ' + 'MainScreen.ml'.tr().toString(),
                                  style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.bottle, size: 50),
                              Text('500 ' + 'MainScreen.ml'.tr().toString(),
                                  style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                    ],
                  ),
                ),
              ),

              //history block

              ButtonsBackgroundRectangle(
                height: SizeConfig.blockSizeVertical * 25.6,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(width: SizeConfig.blockSizeVertical * 2.1),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 6.5,
                          vertical: SizeConfig.blockSizeVertical * 2.1),
                      child: new Text(
                          'MainScreen.history'.tr().toString() + ':',
                          style: TEXT_THEME.headline4),
                    ),
                    SizedBox(width: SizeConfig.blockSizeVertical * 2.1),
                    HistoryButton(time: "08:33", info: '250ml of water'),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                    HistoryButton(time: "08:33", info: '250ml of water'),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                    HistoryButton(time: "08:33", info: '250ml of water'),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                    HistoryButton(time: "08:33", info: '250ml of water'),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                    HistoryButton(time: "08:33", info: '250ml of water'),
                    SizedBox(height: SizeConfig.blockSizeVertical * 1.8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
