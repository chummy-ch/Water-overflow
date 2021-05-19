import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

import 'AppIcons.dart';

class HistoryButton extends StatelessWidget {
  final String time, info;
  final VoidCallback trashPress;

  const HistoryButton({Key key, @required this.time, @required this.info, @required this.trashPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeHorizontal * 8.3,
      width: SizeConfig.blockSizeVertical * 40.5,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 6.5,
          vertical: SizeConfig.blockSizeVertical),
      decoration: BoxDecoration(
        color: COLOR_BUTTON,
        boxShadow: [BASIC_SHADOW],
        gradient: BASIC_GRADIENT,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          AppIcons.drop,
          size: 16,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          time,
          style: TEXT_THEME.headline6,
        ),
        Spacer(flex: 1),
        Text(
          info,
          style: TEXT_THEME.headline6,
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: trashPress,
          child: Icon(
            AppIcons.trash,
            size: 16,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ]),
    );
  }
}
