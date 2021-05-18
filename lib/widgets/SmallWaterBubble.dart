import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_overflow/models/HistoryModel.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/AppIcons.dart';

class DynamicWeek extends StatelessWidget {
  const DynamicWeek({Key key}) : super(key: key);

  static Future<double> _loadProgress(int index) async {
    var pastWeek = await UserViewModel.getWeekProgress();
    print(pastWeek);
    return max(
        pastWeek[index], 0); // TODO:Day
  }

  Future _w(int index) async {
    UserViewModel.getWeekProgress().then((value) => print("\n~~~~~~~" + value.toString() + "~~~~~~~\n"));
    return Center(
      child: Container(
        width: SizeConfig.blockSizeVertical * 10,
        height: SizeConfig.blockSizeVertical * 10,
        child: LiquidCircularProgressIndicator(
          value: await _loadProgress(index),
          // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(Colors.lightBlue[200]),
          backgroundColor: COLOR_TRANSPARENT,
          direction: Axis.vertical,
        ),
      ),
    );
  }

  Widget _showBubble(DateTime dateTime, int index, context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(toBeginningOfSentenceCase(DateFormat(
                'EEEE', EasyLocalization.of(context).currentLocale.toString())
            .format(dateTime))),
        FutureBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    width: SizeConfig.blockSizeVertical * 10,
                    height: SizeConfig.blockSizeVertical * 10,
                    child: LiquidCircularProgressIndicator(
                        value: 0,
                    // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(Colors.lightBlue[200]),
                    backgroundColor: COLOR_TRANSPARENT,
                    direction: Axis.vertical,
                  ),
                ),
              );
              }
              return snapshot.data;
            },
            future: _w(index)),
      ],
    );
  }

  List<Widget> _showBubbles(context) {
    DateTime today = DateTime.now();
    List<Widget> list = [];
    for (int i = 6; i >= 0; i--) {
      list.add(_showBubble(
          new DateTime(today.year, today.month, today.day - i), i, context));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    List<Widget> week = _showBubbles(context);
    Timer(Duration(milliseconds: 50), () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
    return Container(
      width: SizeConfig.blockSizeHorizontal * 85.37,
      height: SizeConfig.blockSizeVertical * 13,
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => VerticalDivider(),
        scrollDirection: Axis.horizontal,
        itemCount: 7, //TODO: Add infinity line
        itemBuilder: (context, index) => week[index],
      ),
    );
  }
}

