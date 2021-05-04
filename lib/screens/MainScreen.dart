import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/custom/AppIcons.dart';
import 'package:water_overflow/custom/PanelButton.dart';
import 'package:water_overflow/custom/SimpleButton.dart';
import 'package:water_overflow/utils/Constants.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

final double liquidBlockSpace = SizeConfig.blockSizeVertical * 1.6;
final double liquidBlockSize = SizeConfig.blockSizeVertical * 10.8;

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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PanelButton(
                      height: 34,
                      width: 34,
                      child: Icon(AppIcons.settings, size: 24),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      height: 34,
                      width: 34,
                      child: Icon(AppIcons.statistics, size: 24),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      height: 34,
                      width: 34,
                      child: Icon(AppIcons.notification, size: 24),
                    )
                  ],
                ),
              ),
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
                child: PanelButton(
                  width: SizeConfig.blockSizeHorizontal * 90.5,
                  height: SizeConfig.blockSizeVertical * 13.17,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: liquidBlockSpace),
                      new SimpleButton(
                        width: SizeConfig.blockSizeVertical * 10.8,
                        height: SizeConfig.blockSizeVertical * 10.8,
                        margin:
                            EdgeInsets.symmetric(vertical: liquidBlockSpace),
                        child: Icon(AppIcons.plus, size: 40),
                      ),
                      SizedBox(width: liquidBlockSpace),
                      new SimpleButton(
                        width: liquidBlockSize,
                        height: liquidBlockSize,
                        margin:
                            EdgeInsets.symmetric(vertical: liquidBlockSpace),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.coffee_cup, size: 45),
                              Text('120 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: liquidBlockSpace),
                      new SimpleButton(
                        width: liquidBlockSize,
                        height: liquidBlockSize,
                        margin:
                            EdgeInsets.symmetric(vertical: liquidBlockSpace),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.glass, size: 40),
                              Text('240 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: liquidBlockSpace),
                      new SimpleButton(
                        width: liquidBlockSize,
                        height: liquidBlockSize,
                        margin:
                            EdgeInsets.symmetric(vertical: liquidBlockSpace),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.coffee_glass, size: 45),
                              Text('340 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: liquidBlockSpace),
                      new SimpleButton(
                        width: liquidBlockSize,
                        height: liquidBlockSize,
                        margin:
                            EdgeInsets.symmetric(vertical: liquidBlockSpace),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.bottle, size: 50),
                              Text('500 ml', style: TEXT_THEME.headline5),
                            ]),
                      ),
                      SizedBox(width: liquidBlockSpace),
                    ],
                  ),
                ),
              ),
              //history block
              Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.4),
                  child: PanelButton(
                    width: SizeConfig.blockSizeHorizontal * 90.5,
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
                        new SimpleButton(
                          height: SizeConfig.blockSizeHorizontal * 8.3,
                          width: SizeConfig.blockSizeVertical * 40.5,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 6.5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  AppIcons.drop,
                                  size: 16,
                                ),
                                Text(
                                  '08:33',
                                  style: TEXT_THEME.headline6,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 15,
                                ),
                                Text(
                                  '250ml of water',
                                  style: TEXT_THEME.headline6,
                                ),
                                Icon(
                                  AppIcons.trash,
                                  size: 16,
                                ),
                              ]),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                        new SimpleButton(
                          height: SizeConfig.blockSizeHorizontal * 8.3,
                          width: SizeConfig.blockSizeVertical * 40.5,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 6.5),
                          child: Text(
                            '2',
                            style: TEXT_THEME.headline2,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                        new SimpleButton(
                          height: SizeConfig.blockSizeHorizontal * 8.3,
                          width: SizeConfig.blockSizeVertical * 40.5,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 6.5),
                          child: Text(
                            '3',
                            style: TEXT_THEME.headline2,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                        new SimpleButton(
                          height: SizeConfig.blockSizeHorizontal * 8.3,
                          width: SizeConfig.blockSizeVertical * 40.5,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 6.5),
                          child: Text(
                            '4',
                            style: TEXT_THEME.headline2,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 2.1),
                        new SimpleButton(
                          height: SizeConfig.blockSizeHorizontal * 8.3,
                          width: SizeConfig.blockSizeVertical * 40.5,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 6.5),
                          child: Text(
                            '5',
                            style: TEXT_THEME.headline2,
                          ),
                        ),
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
