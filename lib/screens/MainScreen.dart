import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                      child: Icon(
                        Icons.notifications,
                        color: COLOR_BLACK,
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.stacked_bar_chart,
                        color: COLOR_BLACK,
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.settings,
                        color: COLOR_BLACK,
                      ),
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
              Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3.52),
                  child: PanelButton(
                      width: SizeConfig.blockSizeHorizontal * 90.5,
                      height: SizeConfig.blockSizeVertical * 13.17,
                      child: SimpleButton(
                        width: SizeConfig.blockSizeHorizontal * 19.5,
                        height: SizeConfig.blockSizeVertical * 10.8,
                      ))),
              Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.4),
                  child: PanelButton(
                      width: SizeConfig.blockSizeHorizontal * 90.5,
                      height: SizeConfig.blockSizeVertical * 25.6)),
            ],
          ),
        ),
      ),
    );
  }
}
