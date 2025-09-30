import 'package:flutter/material.dart';
import 'package:http_app/product_page.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsPage(),
    );
  }
}