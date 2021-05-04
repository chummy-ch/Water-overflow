import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class PanelButton extends StatelessWidget {
  final Widget child;
  final double height, width;

  const PanelButton({Key key, this.height, this.width, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: COLOR_BUTTON, boxShadow: [
        BoxShadow(
          offset: const Offset(1.0, 3.0),
          blurRadius: 4.0,
          spreadRadius: 0.7,
        )
      ]),
      child: Center(child: child),
    );
  }
}
