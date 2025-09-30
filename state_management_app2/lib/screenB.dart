import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  final int counter;

  const ScreenB({super.key, required this.counter});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('${widget.counter}')],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
    ;
  }
}
