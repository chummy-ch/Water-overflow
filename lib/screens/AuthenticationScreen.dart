import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:password_validator/password_validator.dart";
import 'package:water_overflow/models/User.dart' as MyUser;
import 'package:water_overflow/utils/AuthService.dart';
import 'package:water_overflow/utils/Constants.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  PasswordValidator passwordValidator = new PasswordValidator(
      uppercase: 1,
      min: 8,
      max: 50,
      digits: 2,
      blacklist: ["password", "mysecretpassword"]);
  bool _isLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _showLogo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              PROJECT_NAME.toUpperCase(),
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: COLOR_WATER),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint,
        TextEditingController textEditingController, bool isSecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: textEditingController,
          obscureText: isSecure,
          style: TextStyle(fontSize: 20, color: COLOR_DARK_BLUE),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: COLOR_BLUE_WHITE),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: COLOR_BLUE_WHITE, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: COLOR_WHITE, width: 1)),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: COLOR_WATER),
                  child: icon,
                ),
              )),
        ),
      );
    }

    Widget _button(String text, void foo()) {
      return ElevatedButton(
        onPressed: foo,
        style: ElevatedButton.styleFrom(
          primary: COLOR_BLUE_WHITE,
          shadowColor: COLOR_BLACK,
          onPrimary: COLOR_BUTTON,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: COLOR_DARK_BLUE,
              fontSize: 20),
        ),
      );
    }

    Widget _form(String label, void foo()) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 70),
              child:
                  _input(Icon(Icons.email), 'EMAIL', _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 0),
              child: _input(
                  Icon(Icons.lock), 'PASSWORD', _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, foo),
              ),
            )
          ],
        ),
      );
    }

    void showToast(String text) {
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 50);
    }

    void _loginUser() async {
      _email = _emailController.text.trim();
      _password = _passwordController.text.trim();

      if (!EmailValidator.validate(_email)) {
        showToast("Please check email\nThen repeat again");
        return;
      }
      if (!passwordValidator.validate(_password)) {
        showToast("Please check password\nThen repeat again");
        return;
      }

      MyUser.User user =
          await _authService.signInWithEmailAndPassword(_email, _password);
      if (user == null) {
        showToast("Please check email and password\nThen repeat again");
        return;
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerUser() async {
      _email = _emailController.text.trim();
      _password = _passwordController.text.trim();

      if (!EmailValidator.validate(_email)) {
        showToast("Email is not correct");
        return;
      }
      if (!passwordValidator.validate(_password)) {
        showToast(
            "Password must contain:\nMinimal length: 8\nMaximal length: 50\nUppercase letter: 1\nDigits: 2");
        return;
      }

      MyUser.User user =
          await _authService.signUpWithEmailAndPassword(_email, _password);
      if (user == null) {
        showToast("The account already exists for that email.");
        return;
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      body: Column(
        children: [
          _showLogo(),
          (_isLogin
              ? Column(children: [
                  _form('LOG IN', _loginUser),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Text(
                        'Don`t have account? Sign in!',
                      ),
                      onTap: () {
                        setState(() {
                          _isLogin = false;
                        });
                      },
                    ),
                  )
                ])
              : Column(children: [
                  _form('SIGN IN', _registerUser),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Text(
                        'Already have account? Log in!',
                      ),
                      onTap: () {
                        setState(() {
                          _isLogin = true;
                        });
                      },
                    ),
                  )
                ])),
        ],
      ),
    );
  }
}
