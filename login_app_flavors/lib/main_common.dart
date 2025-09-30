// lib/main_common.dart
import 'package:flutter/material.dart';
import 'package:login_app_flavors/screens/login_screen.dart';
import 'flavors.dart';

void mainCommon() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: F.appTitle, home: LoginScreen());
  }
}
