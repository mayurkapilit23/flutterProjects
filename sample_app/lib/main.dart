import 'package:flutter/material.dart';
import 'package:sample_app/loginPage.dart';
import 'package:sample_app/onboardingScreen.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
