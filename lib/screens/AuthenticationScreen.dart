import 'package:easy_localization/easy_localization.dart';
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
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
        child: Container(
          child: Align(
            child: Text(
              "title".tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 35,
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
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
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
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05),
                child: IconTheme(
                  data: IconThemeData(color: COLOR_WATER),
                  child: icon,
                ),
              )),
        ),
      );
    }

    Widget _button(String text, void foo(), {bool googleLogo = false}) {
      return ElevatedButton(
        onPressed: foo,
        style: ElevatedButton.styleFrom(
          primary: COLOR_BLUE_WHITE,
          shadowColor: COLOR_BLACK,
          onPrimary: COLOR_BUTTON,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            googleLogo
                ? Image.asset(
                    'assets/icons/google_icon.png',
                  )
                : SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: COLOR_DARK_BLUE,
                  fontSize: 20),
            ),
            SizedBox.shrink(),
          ],
        ),
      );
    }

    Widget _form(String label, void foo()) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.05, top: 0),
              child: _input(
                  Icon(Icons.email),
                  "WelcomeScreen.email".tr().toString().toUpperCase(),
                  _emailController,
                  false),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.05, top: 0),
              child: _input(
                  Icon(Icons.lock),
                  "WelcomeScreen.password".tr().toString().toUpperCase(),
                  _passwordController,
                  true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.width * 0.05),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
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

    void _signGoogle() async {
      MyUser.User user = await _authService.signInWithGoogle();
      if (user == null) {
        showToast(
            "WelcomeScreen.validation.checkEmailAndPassword".tr().toString());
        return;
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Widget _googleForm() {
      return Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            bottom: MediaQuery.of(context).size.width * 0.05),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: _button(
              "WelcomeScreen.enterByGoogle".tr().toString(), _signGoogle,
              googleLogo: true),
        ),
      );
    }

    void _loginUser() async {
      _email = _emailController.text.trim();
      _password = _passwordController.text.trim();

      if (!EmailValidator.validate(_email)) {
        showToast("WelcomeScreen.validation.checkEmail".tr().toString());
        return;
      }
      if (!passwordValidator.validate(_password)) {
        showToast("WelcomeScreen.validation.checkPassword".tr().toString());
        return;
      }

      MyUser.User user =
          await _authService.signInWithEmailAndPassword(_email, _password);
      if (user == null) {
        showToast(
            "WelcomeScreen.validation.checkEmailAndPassword".tr().toString());
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
        showToast("WelcomeScreen.validation.incorrectEmail".tr().toString());
        return;
      }
      if (!passwordValidator.validate(_password)) {
        showToast("WelcomeScreen.validation.incorrectPassword".tr(namedArgs: {
          'minLen': passwordValidator.min.toString(),
          'maxLen': passwordValidator.max.toString(),
          'upperLet': passwordValidator.uppercase.toString(),
          'digits': passwordValidator.digits.toString()
        }).toString());
        return;
      }

      MyUser.User user =
          await _authService.signUpWithEmailAndPassword(_email, _password);
      if (user == null) {
        showToast(
            "WelcomeScreen.validation.alreadyCreatedAccount".tr().toString());
        return;
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Widget _languageForm(String lang) {
      return Padding(
        padding: EdgeInsets.only(right: 10, bottom: 5),
        child: GestureDetector(
          child: Text(
            lang == 'en' ? 'English' : 'Русский',
            style: TextStyle(
                fontWeight:
                    EasyLocalization.of(context).currentLocale == Locale(lang)
                        ? FontWeight.bold
                        : FontWeight.normal),
          ),
          onTap: () {
            setState(() {
              context.setLocale(Locale(lang));
            });
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _showLogo(),
          (_isLogin
              ? Column(children: [
                  _form(
                      "WelcomeScreen.logIn.logIn".tr().toString(), _loginUser),
                  _googleForm(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Text(
                        "WelcomeScreen.logIn.change".tr().toString(),
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
                  _form("WelcomeScreen.signIn.signIn".tr().toString(),
                      _registerUser),
                  _googleForm(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Text(
                        "WelcomeScreen.signIn.change".tr().toString(),
                      ),
                      onTap: () {
                        setState(() {
                          _isLogin = true;
                        });
                      },
                    ),
                  ),
                ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_languageForm('en'), _languageForm('ru')],
          )
        ],
      ),
    );
  }
}
