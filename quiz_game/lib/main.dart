import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  print('main method');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyApp build method");
    return MaterialApp(home: FirstPage(), debugShowCheckedModeBanner: false);
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(context) {
    print("FirstPage build method");
    return Scaffold(body: Text("Hello"));
  }
}
