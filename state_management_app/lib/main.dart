import 'package:flutter/material.dart';
import 'package:state_management_app/page_two.dart';

import 'my_stateful_widget.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 1;

  void _navigate() async {
    var value = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => PageTwo(counter: _count)));
    if (value != null) {
      setState(() {
        _count = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Counts: $_count", style: TextStyle(fontSize: 35)),
            // ExampleStatefulPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigate();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
