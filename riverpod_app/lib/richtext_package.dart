import 'package:flutter/material.dart';

class RichtextPackage extends StatelessWidget {
  const RichtextPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
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
      ),
    );
  }
}
