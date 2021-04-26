import 'package:flutter/material.dart';
import 'package:water_overflow/screens/mainScreen.dart';
import 'package:water_overflow/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: COLOR_BACKGROUND , textTheme: TEXT_THEME, fontFamily: "SairaCondensed-Light" ),
      home: mainScreen(),
    );
  }
}
