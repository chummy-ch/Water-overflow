import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_overflow/models/UserPresenterModel.dart';
import 'package:water_overflow/utils/Constants.dart';

class Dialogs {
  static Future<String> createDialog(BuildContext context, String title) {
    TextEditingController textEditingController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
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
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(textEditingController.text.toString());
                  },
                  child: Text('OK')),
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
      helpText: 'Enter your date of birth', // TODO: To localization
    );
  }

  static Future<int> selectWeight(BuildContext context) {
    return _showNumberDialog(
        context,
        'Enter your weight',
        UserPresenterModel.MIN_WEIGHT_OF_USER,
        UserPresenterModel.MAX_WEIGHT_OF_USER,
        60); // TODO: To localization, initial
  }

  static Future<int> selectHeight(BuildContext context) {
    return _showNumberDialog(
        context,
        'Enter your height',
        UserPresenterModel.MIN_HEIGHT_OF_USER,
        UserPresenterModel.MAX_HEIGHT_OF_USER,
        160); // TODO: To localization, initial
  }

  static Future<int> _showNumberDialog(BuildContext context, String title,
      int minValue, int maxValue, int initialValue) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
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
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(initialValue);
                    },
                    child: Text('OK')),
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
            title: Text('Exit?'), //TODO: local
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(COLOR_BUTTON)),
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  static Future<bool> showGender(BuildContext context, bool initialValue) {
    return _radioButtons(context, 'Choose you gender', initialValue, 'Male',
        'Female'); //TODO: local
  }

  static Future<bool> showLanguage(BuildContext context, bool initialValue) {
    return _radioButtons(context, 'Choose language', initialValue, 'English',
        'Russian'); //TODO: local
  }

  static Future<bool> _radioButtons(BuildContext context, String title,
      bool initialValue, String variant1, String variant2) {
    bool res = initialValue;
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
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
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(res);
                    },
                    child: Text('OK')),
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
              title: Text('Choose your active hours per week'),
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
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(hpw);
                    },
                    child: Text('OK')),
              ],
            );
          });
        });
  }

  static String _getLevelOfActivityByHours(double value){
    if(value < 5){
      return 'Low activity';
    }
    else if(value < 10){
      return 'Normal activity';
    }
    else if(value < 20){
      return 'Enough activity';
    }
    else{
      return 'Height activity';
    }
  }
}
