import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final double height, width;
  final EdgeInsetsGeometry margin;

  const GradientButton(
      {Key key, this.height, this.width, this.margin, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: COLOR_BUTTON,
        boxShadow: [
          BASIC_SHADOW
        ],
        gradient: BASIC_GRADIENT,
      ),
      child: Center(child: child),
    );
  }
}
