import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

import 'PSettingsButton.dart';

class SettingsButton extends StatelessWidget {
  final String name;

  final VoidCallback onTap;

  const SettingsButton({Key key, @required this.name,  this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
      child:  Container(
      width: SizeConfig.blockSizeHorizontal * 80.73,
      height: SizeConfig.blockSizeVertical * 5.19,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
      decoration: BoxDecoration(
        color: COLOR_BUTTON,
        boxShadow: [BASIC_SHADOW],
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
    ));
  }
}
