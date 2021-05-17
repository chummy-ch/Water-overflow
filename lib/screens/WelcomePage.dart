import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_overflow/models/User.dart' as MyUser;
import 'package:water_overflow/screens/MainScreen.dart';
import 'package:water_overflow/userinformation/UserViewModel.dart';

import 'AuthenticationScreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyUser.User user = Provider.of<MyUser.User>(context);
    final bool isLoggedIn = user != null;
    UserViewModel.setUser(user);
    if (isLoggedIn) UserViewModel.loadUserModel();
    return isLoggedIn ? MainScreen() : AuthenticationScreen();
    // return MainScreen();
  }
}
