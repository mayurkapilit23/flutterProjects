import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final email;

  const HomeScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Email : $email")));
  }
}
