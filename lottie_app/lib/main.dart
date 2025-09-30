import 'package:flutter/material.dart';
import 'package:lottie_app/lottie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LottiePage(), debugShowCheckedModeBanner: false);
  }
}
