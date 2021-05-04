import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_overflow/models/User.dart' as MyUser;
import 'package:water_overflow/screens/AuthenticationScreen.dart';
import 'package:water_overflow/screens/MainScreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyUser.User user = Provider.of<MyUser.User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? MainScreen() : AuthenticationScreen();
  }
}
