import 'package:flutter/material.dart';
import 'package:plant_app/addPlant.dart';
import 'package:plant_app/home.dart';
import 'package:plant_app/onBoarding.dart';

void main() {
  runApp(MyPlant());
}

class MyPlant extends StatelessWidget {
  const MyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
