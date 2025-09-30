import 'package:flutter/material.dart';
import 'package:quizz_app/screens/onBoardingScreen.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(child: OnboardingScreen()),
    );
  }
}
