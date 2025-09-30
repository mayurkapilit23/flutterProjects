import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SimpleCalculator());
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  var _firstController = TextEditingController();
  var _secondController = TextEditingController();

  int num1 = 0, num2 = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _firstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter number"),
              ),
              TextField(
                controller: _secondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter number"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num1 = int.parse(_firstController.text.toString());
                        num2 = int.parse(_secondController.text.toString());
                        result = num1 + num2;
                        _firstController.clear();
                        _secondController.clear();
                      });
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
              Text("Result $result"),
            ],
          ),
        ),
      ),
    );
  }
}
