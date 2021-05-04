import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:water_overflow/screens/MainScreen.dart';
import 'package:water_overflow/utils/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final _initialization  = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: COLOR_BACKGROUND , textTheme: TEXT_THEME, fontFamily: "SairaCondensed-Light" ),
      home:FutureBuilder(
        future: _initialization ,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print('ERROR! ${snapshot.error.toString()}');
            return Text('Something wrong!');
          }
          else if(snapshot.hasData){
            print('All correct');
            return MainScreen();
          }
          else{
            return Center(child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
