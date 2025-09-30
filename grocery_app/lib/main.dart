import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/addToCartScreen.dart';
import 'package:grocery_app/screens/fruitSearchScreen.dart';
import 'package:grocery_app/screens/homeScreen.dart';
import 'package:grocery_app/screens/onBoardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/onBoardingScreen',
      routes: {
        '/onBoardingScreen':(context) => OnBoardingScreen(),
        '/homeScreen':(context) => HomeScreen(),
        '/fruitSearchScreen':(context) => FruitSearchScreen(),
        '/addToCardScreen':(context) => AddToCartScreen(),
      },
    );
  }
}
