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
          BASIC_SHADOW
        ],
        gradient: BASIC_GRADIENT,
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
