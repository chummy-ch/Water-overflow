import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class ButtonsBackgroundRectangle extends StatelessWidget {
  final Widget child;
  final double height, width;

  const ButtonsBackgroundRectangle({
    Key key,
    this.height,
    this.width,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90.5,
      height: height,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1.7),
      decoration: BoxDecoration(color: COLOR_BUTTON, boxShadow: [BASIC_SHADOW]),
      child: child,
    );
  }
}
