import 'package:flutter/material.dart';

class Fruits {
  Fruits({
    required this.name,
    required this.image,
    required this.color,
    required this.price,
    required this.description,
  });

  final String name;
  final String image;
  final Color color;
  final double price;
  final String description;
}
