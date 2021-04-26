import 'package:flutter/material.dart';
import 'package:water_overflow/utils/constants.dart';

class panelButton extends StatelessWidget{
  final Widget child;
  final EdgeInsets padding;
  final double height, width;

  const panelButton({Key key, this.padding, this.height, this.width,
    @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          color: COLOR_BUTTON,
          boxShadow:[ BoxShadow(offset: const Offset(1.0, 3.0),
            blurRadius: 4.0,
            spreadRadius: 0.7,)]
      ),
      child: Center(child: child),
    );
  }
}