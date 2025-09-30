import 'package:flutter/material.dart';
import 'package:transition_page_app/caurosal/caurasoalPage.dart';
import 'package:transition_page_app/first_page.dart';
import 'package:transition_page_app/shimmerapp/ShimmerLoadingScreen%20.dart';

void main() {
  runApp(MaterialApp(
    home: CaurasoalPage(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CaurasoalPage(), debugShowCheckedModeBanner: false);
  }
}
