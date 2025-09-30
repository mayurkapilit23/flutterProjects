import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/textProvider.dart';
import 'package:provider_app/screens/homeScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => TextProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}
