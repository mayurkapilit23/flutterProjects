import 'package:flutter/material.dart';
import 'package:transition_page_app/shimmerapp/ShimmerList%20.dart';
import 'package:transition_page_app/shimmerapp/YourDataWidget%20.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Loading'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerList(); // Shimmer effect while loading
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return YourDataWidget(data: snapshot.data!);
          }
        },
      ),
    );
  }

  Future<List<String>> fetchData() async {
    // Simulate data fetching delay
    await Future.delayed(Duration(seconds: 2));
    return ['Item 1', 'Item 2', 'Item 3'];
  }
}