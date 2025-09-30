
import 'package:flutter/material.dart';

class MyPlant extends StatefulWidget {
  const MyPlant({super.key});

  @override
  State<MyPlant> createState() => _MyPlantState();
}

class _MyPlantState extends State<MyPlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text("My Plant", textAlign: TextAlign.center)],
        ),
      ),
    );;
  }
}
