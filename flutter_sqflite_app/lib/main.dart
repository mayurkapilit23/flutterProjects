import 'package:flutter/material.dart';
import 'package:flutter_sqflite_app/data/local/db_helper.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    DBHelper db = DBHelper.getInstance();
    return Scaffold(body: Center(child: Text("Hello world")));
  }
}
