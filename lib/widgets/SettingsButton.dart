import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

import 'PSettingsButton.dart';

class SettingsButton extends PersonalSettingsButton {
  final String name;

  const SettingsButton({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 80.73,
      height: SizeConfig.blockSizeVertical * 5.19,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 0.89),
      decoration: BoxDecoration(
        color: COLOR_BUTTON,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.5, 1.5),
            blurRadius: 4.0,
            spreadRadius: 0.5,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.9],
          colors: [
            COLOR_BUTTON,
            COLOR_BLUE_WHITE,
            COLOR_BUTTON,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TEXT_THEME.subtitle1,
          ),
        ],
      ),
    );
  }
}
