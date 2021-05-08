import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_overflow/custom/Block.dart';
import 'package:water_overflow/custom/PanelButton.dart';
import 'package:water_overflow/utils/Constants.dart';

import 'MainScreen.dart';

class SettingsScreen extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //PanelButton
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  children: [
                    PanelButton(
                      screen: MainScreen(),
                      child: Icon(Icons.arrow_back, size: 24),
                    ),
                  ],
                ),
              ),
              Block(
                height: SizeConfig.blockSizeVertical * 38.4,
                child: Text(
                  'Personal information',
                  style: TEXT_THEME.headline2,
                ),
              ),
              Block(
                height: SizeConfig.blockSizeVertical * 37.6,
                child: Text(
                  'Information',
                  style: TEXT_THEME.headline2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
