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
            offset: const Offset(0.5, 1.5),
            blurRadius: 4.0,
            spreadRadius: 0.5,
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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 10,),
        Icon(
          AppIcons.drop,
          size: 16,
        ),
            SizedBox(width: 10,),
        Text(
          time,
          style: TEXT_THEME.headline6,
        ),
            Spacer(flex: 1),
        Text(
          info,
          style: TEXT_THEME.headline6,
        ),
            SizedBox(width: 10,),
        Icon(
          AppIcons.trash,
          size: 16,
        ),
            SizedBox(width: 10,),
      ]),
    );
  }
}
