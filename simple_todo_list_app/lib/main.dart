import 'package:flutter/material.dart';
import 'package:simple_todo_list_app/todoApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todoapp(),
    );
  }
}



