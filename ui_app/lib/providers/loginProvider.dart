import 'package:flutter/material.dart';
import 'package:ui_app/screens/homeScreen.dart';

class LoginProvider extends ChangeNotifier {
  String _email = '';
  String _password = "";

  String get email => _email;

  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void login(BuildContext context) {
    if (_email.isEmpty || _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
    } else {
      if (_email == 'mayur' && _password == 'admin123') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Logged in as $_email')));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }
}
