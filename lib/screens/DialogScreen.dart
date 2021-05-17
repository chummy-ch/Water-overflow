import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_overflow/models/UserPresenterModel.dart';
import 'package:water_overflow/utils/Constants.dart';
import 'package:water_overflow/widgets/LiquidChooseButton.dart';

class Dialogs {
  static Future<String> createDialog(BuildContext context, String title) {
    TextEditingController textEditingController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: COLOR_BACKGROUND,
            title: Text(title),
            content: TextField(
              controller: textEditingController,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(null);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(COLOR_BUTTON)),
                  child: Text('DialogScreen.cancel'.tr())),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(textEditingController.text.toString());
                  },
                  child: Text('DialogScreen.ok'.tr())),
            ],
          );
        });
  }

  static Future<DateTime> selectDate(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime minAge = new DateTime(
        today.year - UserPresenterModel.MIN_AGE_OF_USER,
        today.month,
        today.day);
    DateTime maxAge = new DateTime(
        today.year - UserPresenterModel.MAX_AGE_OF_USER,
        today.month,
        today.day);
    return showDatePicker(
      context: context,
      firstDate: maxAge,
      lastDate: minAge,
      initialDate: minAge,
      helpText: 'DialogScreen.enterBirthDate'.tr(),
    );
  }

  static Future<int> selectWeight(BuildContext context, int initialValue) {
    return _showNumberDialog(
        context,
        'DialogScreen.enterWeight'.tr(),
        UserPresenterModel.MIN_WEIGHT_OF_USER,
        UserPresenterModel.MAX_WEIGHT_OF_USER,
        initialValue); // TODO: Add initial value
  }

  static Future<int> selectHeight(BuildContext context, int initialValue) {
    return _showNumberDialog(
        context,
        'DialogScreen.enterHeight'.tr(),
        UserPresenterModel.MIN_HEIGHT_OF_USER,
        UserPresenterModel.MAX_HEIGHT_OF_USER,
        initialValue); // TODO: Add initial value
  }

  static Future<int> _showNumberDialog(BuildContext context, String title,
      int minValue, int maxValue, int initialValue) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: COLOR_BACKGROUND,
              title: Text(title),
              content: NumberPicker(
                value: initialValue,
                maxValue: maxValue,
                minValue: minValue,
                onChanged: (value) {
                  setState(() => initialValue = value);
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(COLOR_BUTTON)),
                    child: Text('DialogScreen.cancel'.tr())),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(initialValue);
                    },
                    child: Text('DialogScreen.ok'.tr())),
              ],
            );
          });
        });
  }

  static Future<bool> showExitScreenAndExit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: COLOR_BACKGROUND,
            title: Text('DialogScreen.exit'.tr()),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(COLOR_BUTTON)),
                  child: Text('DialogScreen.cancel'.tr())),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('DialogScreen.ok'.tr())),
            ],
          );
        });
  }

  static Future<bool> showGender(BuildContext context, bool initialValue) {
    return _radioButtons(context, 'DialogScreen.chooseGender'.tr(),
        initialValue, 'DialogScreen.male'.tr(), 'DialogScreen.female'.tr());
  }

  static Future<bool> showLanguage(BuildContext context, bool initialValue) {
    return _radioButtons(context, 'DialogScreen.chooseLanguage'.tr(),
        initialValue, 'DialogScreen.english'.tr(), 'DialogScreen.russian'.tr());
  }

  static Future<bool> _radioButtons(BuildContext context, String title,
      bool initialValue, String variant1, String variant2) {
    bool res = initialValue;
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: COLOR_BACKGROUND,
              title: Text(
                title,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(variant1),
                    leading: Radio(
                      value: true,
                      groupValue: res,
                      onChanged: (value) {
                        setState(() {
                          res = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(variant2),
                    leading: Radio(
                      value: false,
                      groupValue: res,
                      onChanged: (value) {
                        setState(() {
                          res = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(COLOR_BUTTON)),
                    child: Text('DialogScreen.cancel'.tr())),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(res);
                    },
                    child: Text('DialogScreen.ok'.tr())),
              ],
            );
          });
        });
  }

  static showActivityScreen(BuildContext context, double initialValue) {
    String res = _getLevelOfActivityByHours(initialValue);
    double hpw = initialValue;
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: COLOR_BACKGROUND,
              title: Text(
                'DialogScreen.chooseActivity'.tr(),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(res),
                  Slider(
                    value: hpw,
                    onChanged: (value) => {
                      setState(() {
                        hpw = value;
                        res = _getLevelOfActivityByHours(value);
                      })
                    },
                    min: 0,
                    max: 30,
                    label: hpw.round().toString(),
                    divisions: 10,
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(COLOR_BUTTON)),
                    child: Text('DialogScreen.cancel'.tr())),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(hpw);
                    },
                    child: Text('DialogScreen.ok'.tr())),
              ],
            );
          });
        });
  }

  static String _getLevelOfActivityByHours(double value) {
    if (value < 5) {
      return 'DialogScreen.lowActivity'.tr();
    } else if (value < 10) {
      return 'DialogScreen.normalActivity'.tr();
    } else if (value < 20) {
      return 'DialogScreen.highActivity'.tr();
    } else {
      return 'DialogScreen.veryHighActivity'.tr();
    }
  }

  /* static List<String> list = ["water", "soda", "black_tea", "coffee", "green_tea",
    "cola", "beer", "wine", "milk"];*/

  static Future<int> selectLiquid(BuildContext context, List<String> names) {
    print(names[0]);
    return _showLiquidDialog(context, 'MainScreen.liquid.title'.tr(), names);
  }

  static Future<int> _showLiquidDialog(
      BuildContext context, String title, List<String> list) {
    int res = 0;
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: COLOR_BACKGROUND,
              title: Text(
                title,
                style: TEXT_THEME.headline2,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (int i = 0; i < list.length; i++)
                    new LiquidChooseButton(
                      text: ('MainScreen.liquid.' + list[i]).tr(),
                      onPressed: () {
                        res = i;
                        Navigator.of(context).pop(res);
                      },
                    )
                ],
              ),
            );
          });
        });
  }

  static Future<int> selectVolume(BuildContext context) {
    return _showNumberDialog(context, 'MainScreen.liquid.volume'.tr(), 1, 1000,
        200); // TODO: Add initial value
  }

  static showVolume(BuildContext context) {
    double hpw = 200;
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: COLOR_BACKGROUND,
              title: Text(
                'MainScreen.liquid.volume'.tr(),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Slider(
                    value: hpw,
                    onChanged: (value) => {
                      setState(() {
                        hpw = value;
                      })
                    },
                    min: 10,
                    max: 1000,
                    label: hpw.round().toString(),
                    divisions: 50,
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(COLOR_BUTTON)),
                    child: Text('DialogScreen.cancel'.tr())),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(hpw);
                    },
                    child: Text('DialogScreen.ok'.tr())),
              ],
            );
          });
        });
  }
}
