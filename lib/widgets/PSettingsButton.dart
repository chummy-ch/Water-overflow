import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class PersonalSettingsButton extends StatelessWidget {
  final String name;
  final String data;
  final VoidCallback onTap;

  const PersonalSettingsButton(
      {Key key, @required this.name, this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 80.73,
        height: SizeConfig.blockSizeVertical * 5.19,
        margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
        decoration: BoxDecoration(
          color: COLOR_BUTTON,
          boxShadow: [BASIC_SHADOW],
          gradient: BASIC_GRADIENT,
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              name,
              style: TEXT_THEME.subtitle1,
            ),
            Spacer(flex: 1),
            Text(
              data,
              style: TEXT_THEME.headline3,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
