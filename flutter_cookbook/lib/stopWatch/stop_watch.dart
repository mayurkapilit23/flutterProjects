import 'package:flutter/material.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Hello ',
            style:TextStyle(color: Colors.blue,fontSize: 25),
            children: <TextSpan>[
              TextSpan(
                text: 'bold',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' Flutter!'),
            ],
          ),
        ),
      ),
    );
  }
}
