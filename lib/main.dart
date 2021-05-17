import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_overflow/models/User.dart';
import 'package:water_overflow/screens/WelcomePage.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';
import 'package:water_overflow/utils/AuthService.dart';
import 'package:water_overflow/utils/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  UserViewModel.loadUserModel();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('ru'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
          scaffoldBackgroundColor: COLOR_BACKGROUND,
          textTheme: TEXT_THEME,
          //TODO: TO Constants
          fontFamily: "SairaCondensed-Light"),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('ERROR! ${snapshot.error.toString()}');
            return Text('Something wrong!');
          } else if (snapshot.hasData) {
            print('All correct');
            return StreamProvider<User>.value(
                value: AuthService().currentUser,
                initialData: null,
                child: WelcomePage());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
