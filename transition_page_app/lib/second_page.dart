import 'package:flutter/material.dart';
import 'package:transition_page_app/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.car_crash, size: 100),
            Text('Second Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) => FirstPage(),
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
              child: Text("Go to First Page"),
            ),
          ],
        ),
      ),
    );
  }
}
