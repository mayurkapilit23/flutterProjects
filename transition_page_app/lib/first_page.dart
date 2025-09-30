import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transition_page_app/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('First Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) => SecondPage(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        // Or SlideTransition
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text("Go to Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}
