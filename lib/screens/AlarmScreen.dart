import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:water_overflow/models/AlarmModel.dart';
import 'package:water_overflow/userinformation/AlarmViewModel.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/Alarm.dart';
import 'package:water_overflow/widgets/CustomPicker.dart';
import 'package:water_overflow/widgets/PanelButton.dart';

List<AlarmModel> list = [];

class AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    AlarmViewModel.loadAlarms().then((value) {
      list = value;
      setState(() {});
    });
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
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
                      tap: () {
                        Navigator.pop(
                          context,
                        );
                      },
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
              new Expanded(
                  child: new ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return Alarm(
                          isOn: list[Index].isON,
                          text: list[Index].time,
                          change: (bool value) {
                            list[Index].isON = value;
                            AlarmViewModel.setAlarms(list);
                          },
                          remove: () {
                            print("remove");
                            if (list.length > 1) {
                              list.removeAt(Index);
                              AlarmViewModel.setAlarms(list);
                              setState(() {});
                            }
                          },
                        );
                      })),
              RawMaterialButton(
                onPressed: () {
                  DatePicker.showPicker(context, showTitleActions: true,
                      onChanged: (date) {
                    //print('change $date in time zone ' +
                    //date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    list.add(AlarmModel(DateFormat.Hm().format(date), true));
                    AlarmViewModel.setAlarms(list)
                        .then((value) => setState(() {}));
                    //print('confirm $date');
                  },
                      theme: DatePickerTheme(
                        backgroundColor: COLOR_BACKGROUND,
                        itemStyle: TEXT_THEME.headline2,
                        doneStyle: TextStyle(color: COLOR_BLACK),
                      ),
                      pickerModel: CustomPicker(currentTime: DateTime.now()),
                      locale: lan());
                },
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 15,
                  height: SizeConfig.blockSizeVertical * 15,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: COLOR_BLUE_DIRTY,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LocaleType lan() {
    //print('AlarmScreen.picker'.tr());
    if ('AlarmScreen.picker'.tr() == 'ru') {
      return LocaleType.ru;
    } else {
      return LocaleType.en;
    }
  }
}

class AlarmScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AlarmScreenState();
}
