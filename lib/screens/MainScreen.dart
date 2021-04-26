import 'package:flutter/material.dart';
import 'package:water_overflow/custom/PanelButton.dart';
import 'package:water_overflow/utils/Constants.dart';

class mainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child:Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    panelButton(
                      height: 34,
                      width: 34,
                      child: Icon(Icons.notifications, color: COLOR_BLACK,),
                    ),
                    SizedBox(width: 16),
                    panelButton(
                      height: 34,
                      width: 34,
                      child: Icon(Icons.stacked_bar_chart, color: COLOR_BLACK,),
                    ),
                    SizedBox(width: 16),
                    panelButton(
                      height: 34,
                      width: 34,
                      child: Icon(Icons.settings, color: COLOR_BLACK, ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(126,214,234, 1.0),
                        Color.fromRGBO(255,255,255, 0.3),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '50%',
                            style: TEXT_THEME.headline1,
                        ),
                        Text(
                            '1100/2200ml',
                            style: TEXT_THEME.headline2,
                        ),
                      ],
                )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}