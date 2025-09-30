import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_app/providers/Counter.dart';
import 'package:ui_app/providers/loginProvider.dart';
import 'package:ui_app/screens/homeScreen.dart';
import 'package:ui_app/screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      ),
    );
  }
}
