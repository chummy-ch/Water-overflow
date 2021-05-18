import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:water_overflow/models/HistoryModel.dart';
import 'package:water_overflow/screens/StatisticsScreen.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/AppIcons.dart';
import 'package:water_overflow/widgets/Block.dart';
import 'package:water_overflow/widgets/HistoryButton.dart';
import 'package:water_overflow/widgets/LiquidButton.dart';
import 'package:water_overflow/widgets/PanelButton.dart';

import 'AlarmScreen.dart';
import 'SettingsScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    var future = UserViewModel.getWeekProgress();
    future.then((value)  {
      value.forEach((element) {print(element);});
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //PanelButtons
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6.3,
                    vertical: SizeConfig.blockSizeVertical * 3.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      child: Icon(AppIcons.settings, size: 24),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatisticsScreen()),
                        );
                      },
                      child: Icon(AppIcons.statistics, size: 24),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    PanelButton(
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlarmScreen()),
                        );
                      },
                      child: Icon(AppIcons.notification, size: 24),
                    ),
                  ],
                ),
              ),
              Blocks()
            ],
          ),
        ),
      ),
    );
  }
}

List<HistoryModel> historyList = [];

class Blocks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DynamicBlocks();
}

class DynamicBlocks extends State<Blocks> {
  double v = 0;
  int volumeGoal = 2000; //TODO: EDIT

  _addLiquid(int volume) {
    HistoryModel model = new HistoryModel(DateTime.now(), volume, "Water");
    historyList.add(model);
    v += volume / volumeGoal;
    UserViewModel.setProgress(v);
    setState(() {});
    UserViewModel.setHistory(historyList);
  }

  @override
  Widget build(BuildContext context) {
    var p = UserViewModel.getProgress();
    p.then((value) {
      v = value;
      setState(() {});
    });
    var f = UserViewModel.getHistory();
    f.then((value) {
      historyList = value;
      setState(() {});
    });

    return new Column(
      children: <Widget>[
        new Container(
          width: SizeConfig.blockSizeVertical * 35.5,
          height: SizeConfig.blockSizeVertical * 35.5,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(126, 214, 234, 1.0),
                COLOR_WHITE,
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: SizeConfig.blockSizeVertical * 31.5,
              height: SizeConfig.blockSizeVertical * 31.5,
              child: LiquidCircularProgressIndicator(
                value: v,
                // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue[200]),
                backgroundColor: COLOR_TRANSPARENT,
                direction: Axis.vertical,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${(v * 100).round()}%",
                      style: TEXT_THEME.headline1,
                    ),
                    Text(
                      '${(v * volumeGoal).round()}/$volumeGoal' +
                          'MainScreen.ml'.tr(),
                      style: TEXT_THEME.headline2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.2),
          child: ButtonsBackgroundRectangle(
            height: SizeConfig.blockSizeVertical * 13.17,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                new LiquidButton(
                  onPressed: () {
                    //_addLiquid();
                  },
                  child: Icon(AppIcons.plus, size: 40),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                new LiquidButton(
                  onPressed: () {
                    _addLiquid(120);
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(AppIcons.coffee_cup, size: 45),
                        Text('120 ' + 'MainScreen.ml'.tr(),
                            style: TEXT_THEME.headline5),
                      ]),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                new LiquidButton(
                  onPressed: () {
                    _addLiquid(240);
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(AppIcons.glass, size: 40),
                        Text('240 ' + 'MainScreen.ml'.tr(),
                            style: TEXT_THEME.headline5),
                      ]),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                new LiquidButton(
                  onPressed: () {
                    _addLiquid(340);
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(AppIcons.coffee_glass, size: 45),
                        Text('340 ' + 'MainScreen.ml'.tr(),
                            style: TEXT_THEME.headline5),
                      ]),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
                new LiquidButton(
                  onPressed: () {
                    _addLiquid(500);
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(AppIcons.bottle, size: 45),
                        Text('500 ' + 'MainScreen.ml'.tr(),
                            style: TEXT_THEME.headline5),
                      ]),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical * 1.6),
              ],
            ),
          ),
        ),
        new ButtonsBackgroundRectangle(
          height: SizeConfig.blockSizeVertical * 25.6,
          child: ListDisplay(),
        ),
      ],
    );
  }
}

class ListDisplay extends StatefulWidget {
  DyanamicList d = new DyanamicList();

  @override
  State createState() => d;
}

class DyanamicList extends State<ListDisplay> {
  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new SizedBox(width: SizeConfig.blockSizeVertical * 2.1),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 6.5,
              vertical: SizeConfig.blockSizeVertical),
          child: new Text('MainScreen.history'.tr() + ':',
              style: TEXT_THEME.headline4),
        ),
        new Expanded(
            child: new ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return new HistoryButton(
                      time: getDate(historyList[Index].time),
                      info: getInfo(Index));
                }))
      ],
    ));
  }

  String getInfo(int i) {
    return "${historyList[i].volume}ml of ${historyList[i].liquid}";
  }

  String getDate(DateTime time) {
    return DateFormat.jm().format(time);
  }
}
