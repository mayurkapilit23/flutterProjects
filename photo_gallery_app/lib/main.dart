import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_gallery_app/photo_gallery_page.dart';

import 'model/product_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGalleryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


