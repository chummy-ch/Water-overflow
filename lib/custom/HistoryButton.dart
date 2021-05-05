import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

import 'AppIcons.dart';

class HistoryButton extends StatelessWidget {
  final String time, info;

  const HistoryButton({Key key, @required this.time, @required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeHorizontal * 8.3,
      width: SizeConfig.blockSizeVertical * 40.5,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 6.5),
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(
          AppIcons.drop,
          size: 16,
        ),
        Text(
          time,
          style: TEXT_THEME.headline6,
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 15,
        ),
        Text(
          info,
          style: TEXT_THEME.headline6,
        ),
        Icon(
          AppIcons.trash,
          size: 16,
        ),
      ]),
    );
  }
}
