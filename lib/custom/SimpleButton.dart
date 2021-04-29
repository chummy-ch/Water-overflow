import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class SimpleButton extends StatelessWidget {
  final Widget child;
  final double height, width;
  final EdgeInsetsGeometry margin;

  const SimpleButton(
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
          BoxShadow(
            offset: const Offset(1.0, 3.0),
            blurRadius: 4.0,
            spreadRadius: 0.7,
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
      child: Center(child: child),
    );
  }
}
