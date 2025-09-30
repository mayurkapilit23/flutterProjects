import 'package:flutter/material.dart';
import 'package:flutter_cookbook/first/immutable_widget.dart';
import 'package:flutter_cookbook/first/text_layout.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text('Sample App', style: TextStyle(color: Colors.white)),
        ),
        actions: [Icon(Icons.edit, color: Colors.white)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1706111577647-1e0ff0437570?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          SizedBox(height: 50),
          TextLayout(),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: Center(child: Text('Drawer')),
        ),
      ),
    );
  }
}
