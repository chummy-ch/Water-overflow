import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/custom/AppIcons.dart';
import 'package:water_overflow/custom/Block.dart';
import 'package:water_overflow/custom/HistoryButton.dart';
import 'package:water_overflow/custom/LiquidButton.dart';
import 'package:water_overflow/custom/PanelButton.dart';
import 'package:water_overflow/screens/StatisticsScreen.dart';
import 'package:water_overflow/utils/Constants.dart';
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
            children: [

              //PanelButtons
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.53),
                child: Container(
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
                          '1100/2200ml',
                          style: TEXT_THEME.headline2,
                        ),
                      ],
                    )),
              ),

              //liquid Block
              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3.52),
                child: Block(
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
                              Text('120 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.glass, size: 40),
                              Text('240 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.coffee_glass, size: 45),
                              Text('340 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                      new LiquidButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.bottle, size: 50),
                              Text('500 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                    ],
                  ),
                ),
              ),

              //history block
              Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.4),
                  child: Block(
                    height: SizeConfig.blockSizeVertical * 25.6,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        SizedBox(width: SizeConfig.blockSizeVertical * 2.1),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 6.5,
                              vertical: SizeConfig.blockSizeVertical * 2.1),
                          child:
                              new Text('History:', style: TEXT_THEME.headline4),
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
