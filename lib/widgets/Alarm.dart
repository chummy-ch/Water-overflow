import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:water_overflow/utils/Constants.dart';

class Alarm extends StatelessWidget {
  final Widget child;
  final double height, width;

  const Alarm({
    Key key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOn = true;
    return Container(
      width: SizeConfig.blockSizeHorizontal * 85.37,
      height: SizeConfig.blockSizeVertical * 9.5,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3),
      decoration: BoxDecoration(color: COLOR_BUTTON, boxShadow: [
        BoxShadow(
          offset: const Offset(0.5, 1.5),
          blurRadius: 4.0,
          spreadRadius: 0.5,
        )
      ]),
      child: Row(
        children: [
          Text(
            '08:00',
            style: TEXT_THEME.headline6,
          ),
          Spacer(flex: 1),
          FlutterSwitch(
            value: isOn,
            onToggle: (val) {
              setState(() {
                isOn = val;
              });
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "Value: $isOn",
            ),
          ),
        ],
      ),
    );
  }
}
