import 'package:flutter/material.dart';

class YourDataWidget extends StatelessWidget {
  final List<String> data;

  const YourDataWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index]),
        );
      },
    );
  }
}