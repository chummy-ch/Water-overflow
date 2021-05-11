import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/Alarm.dart';
import 'package:water_overflow/widgets/CustomPicker.dart';
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
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4.7),
            scrollDirection: Axis.vertical,
            children: [
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
                      Alarm(),
                      Alarm(),
                      Alarm(),
                      Alarm(),
                      Alarm(),
                      Alarm(),
              RawMaterialButton(
                onPressed: () {
                  DatePicker.showPicker(context, showTitleActions: true,
                      onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                      },
                      theme: DatePickerTheme(
                        backgroundColor: COLOR_BACKGROUND,
                        itemStyle: TEXT_THEME.headline2,
                        doneStyle: TextStyle(color: COLOR_BLACK),
                      ),
                      pickerModel: CustomPicker(currentTime: DateTime.now()),
                      locale: lan()
                  );
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
  LocaleType lan(){
    print('AlarmScreen.picker'.tr());
    if('AlarmScreen.picker'.tr() == 'ru'){
      return LocaleType.ru;
    }
    else{
      return LocaleType.en;
    }
  }
}