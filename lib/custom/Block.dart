import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class Block extends StatelessWidget {
  final Widget child;
  final double height, width;

  const Block({
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
      decoration: BoxDecoration(color: COLOR_BUTTON, boxShadow: [
        BoxShadow(
          offset: const Offset(1.0, 3.0),
          blurRadius: 4.0,
          spreadRadius: 0.7,
        )
      ]),
      child: child,
    );
  }
}
