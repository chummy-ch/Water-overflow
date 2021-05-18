import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

import 'AppIcons.dart';

class Alarm extends StatelessWidget {
  final Widget child;
  final double height, width;
  final String text;
  bool isOn;
  ValueChanged<bool> change;
  VoidCallback remove;

  Alarm(
      {Key key,
      @required this.text,
      this.height,
      this.width,
      this.child,
      @required this.change,
      @required this.remove,
      @required this.isOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 85.37,
      height: SizeConfig.blockSizeVertical * 9.5,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3),
      decoration: BoxDecoration(color: COLOR_BUTTON, boxShadow: [BASIC_SHADOW]),
      child: Row(
        children: [
          SizedBox(width: 25),
          Text(
            text,
            style: TEXT_THEME.headline2,
          ),
          Spacer(flex: 1),
          CustomSwitch(
            activeColor: COLOR_BLUE_DIRTY,
            value: isOn,
            onChanged: (value) {
              isOn = !isOn;
              change(isOn);
            },
          ),
          RawMaterialButton(
            onPressed: () {
              remove();
            },
            child: Icon(
              AppIcons.trash,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
