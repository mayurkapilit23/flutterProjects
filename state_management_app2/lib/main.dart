import 'package:flutter/material.dart';
import 'package:state_management_app2/screenA.dart';
import 'package:state_management_app2/screenB.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 1;

  void _navigatA() async {
    var value = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => ScreenA(counter: counter)));

    if (value != null) {
      setState(() {
        counter = value;
      });
    }
  }

  void _navigatB() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => ScreenB(counter: counter)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigatA();
                  },
                  child: Text("Screen A"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigatB();
                  },
                  child: Text("Screen B"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
