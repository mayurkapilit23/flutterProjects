import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showAlertDialoge(context);
            },
            child: Text('Hello  world'),
          ),
        ),
      ),
    );
  }
}

void _showAlertDialoge(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AnimatedContainer(
        curve: Curves.easeOut,
     

        duration: Duration(milliseconds: 300),
        child: AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to proceed?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Proceed'),
              onPressed: () {
                // Perform action and then dismiss the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
