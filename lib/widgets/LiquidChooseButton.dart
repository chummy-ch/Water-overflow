import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class LiquidChooseButton extends MaterialButton {
  final VoidCallback onPressed;
  final String text;

  const LiquidChooseButton({Key key, this.text, @required this.onPressed})
      : super(key: key, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.blockSizeHorizontal * 40,
        height: SizeConfig.blockSizeVertical * 5,
        margin:
        EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.6),
        decoration: BoxDecoration(
          color: COLOR_BUTTON,
          boxShadow: [BASIC_SHADOW],
          gradient: BASIC_GRADIENT,
        ),
        child: RawMaterialButton(
          child: Text(
            text,
            style: TEXT_THEME.headline6,
          ),
          onPressed: onPressed,
        ));
  }
}
