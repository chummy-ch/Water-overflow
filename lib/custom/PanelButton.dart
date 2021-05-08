import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class PanelButton extends StatelessWidget {
  final Widget child;
  final double height, width;
  final StatelessWidget screen;

  const PanelButton(
      {Key key,
      this.height,
      this.width,
      @required this.child,
      @required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(color: COLOR_BUTTON, boxShadow: [
            BoxShadow(
              offset: const Offset(1.0, 3.0),
              blurRadius: 4.0,
              spreadRadius: 0.7,
            )
          ]),
          child: Center(child: child),
        ));
  }
}
