import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/Block.dart';
import 'package:water_overflow/widgets/PanelButton.dart';

import 'MainScreen.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4.7),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              //PanelButton
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 1.5,
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
              ButtonsBackgroundRectangle(
                height: SizeConfig.blockSizeVertical * 15.7,
                child: Column(
                  children: [
                    Text(
                      'StatisticsScreen.weekly'.tr(),
                      style: TEXT_THEME.headline2,
                    ),
                  ],
                ),
              ),
              ButtonsBackgroundRectangle(
                height: SizeConfig.blockSizeVertical * 60.7,
                child: Column(
                  children: [
                    Text(
                      'StatisticsScreen.report'.tr(),
                      style: TEXT_THEME.headline2,
                    ),
                  ],
                ),
              ),
              ButtonsBackgroundRectangle(
                height: SizeConfig.blockSizeVertical * 41.7,
                child: Column(
                  children: [
                    Text(
                      'StatisticsScreen.diagrams'.tr(),
                      style: TEXT_THEME.headline2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
