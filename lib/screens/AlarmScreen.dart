import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/Alarm.dart';
import 'package:water_overflow/widgets/PanelButton.dart';

import 'MainScreen.dart';

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              //PanelButton
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PanelButton(
                      screen: MainScreen(),
                      child: Icon(Icons.arrow_back, size: 24),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6,
                        bottom: SizeConfig.blockSizeVertical * 4),
                    child: Text(
                      'AlarmScreen.alarms'.tr(),
                      style: TEXT_THEME.headline2,
                    ),
                  ),
                ],
              ),
              Alarm(),
              Alarm(),
              Alarm(),
              Spacer(flex: 1),
              Container(
                  width: SizeConfig.blockSizeHorizontal * 10,
                  height: SizeConfig.blockSizeVertical * 10,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: COLOR_BLUE_DIRTY,
                  ),
                  child: Icon(Icons.add,
                  color: Colors.white),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
