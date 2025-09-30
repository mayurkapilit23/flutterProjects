import 'package:flutter/material.dart';
import 'package:login_app_flavors/flavors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            F.logoAsset,
            SizedBox(height: 20),
            Text("Welcome to ${F.appTitle}"),
          ],
        ),
      ),
    );
  }
}