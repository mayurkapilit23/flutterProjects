import 'package:flutter/material.dart';
import 'package:smart_home_control/screens/devices_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff000000),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff000000)),
      ),
      home: DevicesScreen(),
    );
  }
}
