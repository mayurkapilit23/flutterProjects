import 'package:flutter/material.dart';
import 'package:sgm_app/screens/dashboard_screen.dart';
import 'package:sgm_app/screens/splash_screen.dart';

void main() {
  runApp(const GoatApp());
}

class GoatApp extends StatelessWidget {
  const GoatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Goat Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        // add more routes later
      },
    );
  }
}
