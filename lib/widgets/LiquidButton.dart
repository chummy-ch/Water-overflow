import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class LiquidButton extends MaterialButton {
  final Widget child;
  final VoidCallback onPressed;

  const LiquidButton({Key key, @required this.onPressed, @required this.child})
      : super(key: key, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeVertical * 10.8,
      height: SizeConfig.blockSizeVertical * 10.8,
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.6),
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
      child: RawMaterialButton(
        child: child,
        onPressed: onPressed,
      )
    );
  }
}
