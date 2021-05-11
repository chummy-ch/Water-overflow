import 'package:flutter/material.dart';

const COLOR_BLACK = Colors.black;
const COLOR_BACKGROUND = Color.fromRGBO(169, 228, 241, 1.0);
const COLOR_BUTTON = Color.fromRGBO(162, 220, 233, 1.0);
const COLOR_WATER = Color.fromRGBO(37, 144, 249, 1.0);
const COLOR_DARK_BLUE = Color.fromRGBO(0, 84, 166, 1.0);
const COLOR_WHITE = Color.fromRGBO(255, 255, 255, 0.3);
const COLOR_TRANSPARENT = Color.fromRGBO(255, 255, 255, 0.0);
const COLOR_BLUE_WHITE = Color.fromRGBO(202, 245, 255, 1.0);
const COLOR_BLUE_DIRTY = Color.fromRGBO(1, 141, 171, 1.0);
const BASIC_GRADIENT = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.1, 0.5, 0.9],
  colors: [
    COLOR_BUTTON,
    COLOR_BLUE_WHITE,
    COLOR_BUTTON,
  ],
);
const BASIC_SHADOW = BoxShadow(
  offset: const Offset(0.5, 1.5),
  blurRadius: 4.0,
  spreadRadius: 0.5,
);

const TextTheme TEXT_THEME = TextTheme(
  headline1: TextStyle(
      color: COLOR_BLACK,
      fontWeight: FontWeight.bold,
      fontSize: 48,
      fontFamily: 'SairaCondensed'),
  headline2: TextStyle(
      color: COLOR_BLACK,
      fontWeight: FontWeight.normal,
      fontSize: 24,
      fontFamily: 'SairaCondensed'),
  headline3: TextStyle(
      color: COLOR_DARK_BLUE,
      fontWeight: FontWeight.normal,
      fontSize: 18,
      fontFamily: 'SairaCondensed'),
  subtitle1: TextStyle(
      color: COLOR_BLACK,
      fontWeight: FontWeight.normal,
      fontSize: 18,
      fontFamily: 'SairaCondensed'),
  headline4: TextStyle(
      color: COLOR_BLACK,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'SairaCondensed'),
  headline5: TextStyle(
      color: COLOR_BLACK,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      fontFamily: 'SairaCondensed'),
  headline6: TextStyle(
      color: COLOR_BLACK,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      fontFamily: 'SairaCondensed'),
);

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
