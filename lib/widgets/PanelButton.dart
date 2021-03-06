import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class PanelButton extends StatelessWidget {
  final Widget child;
  final double height, width;
  final GestureTapCallback tap;

  const PanelButton(
      {Key key,
      this.height,
      this.width,
      @required this.child,
      @required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: tap,
        child: Container(
          width: SizeConfig.blockSizeVertical * 4,
          height: SizeConfig.blockSizeVertical * 4,
          decoration:
              BoxDecoration(color: COLOR_BUTTON, boxShadow: [BASIC_SHADOW]),
          child: Center(child: child),
        ));
  }
}
