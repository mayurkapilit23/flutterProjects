import 'package:flutter/material.dart';
import 'package:http_get_app/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(title: Text("Http app")),
        body: HomePage(),
      ),
    ),
  );
}
