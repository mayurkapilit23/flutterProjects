import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_app/providers/Counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Icon(Icons.add),
            onPressed: () {
              counter.increment();
            },
          ),
          ElevatedButton(
            child: Icon(Icons.remove),
            onPressed: () {
              counter.decrement();
            },
          ),

          ElevatedButton(
            child: Icon(Icons.circle),
            onPressed: () {
              counter.makeItZero();
            },
          ),
        ],
      ),

      body: Center(child: Text('${counter.count}',style: TextStyle(fontSize: 25),)),
    );
  }
}
