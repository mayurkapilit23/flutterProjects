// lib/flavors.dart
import 'package:flutter/material.dart';

enum Flavor { pizza, coffee }

class F {
  static late Flavor appFlavor;

  static String get name => appFlavor.toString().split('.').last;

  static String get appTitle {
    switch (appFlavor) {
      case Flavor.pizza:
        return 'Pizza Login';
      case Flavor.coffee:
        return 'Coffee Login';
    }
  }

  static Widget get logoAsset {
    switch (appFlavor) {
      case Flavor.pizza:
        return Icon(Icons.local_pizza, size: 100, color: Colors.yellow);
      case Flavor.coffee:
        return Icon(Icons.coffee, size: 100, color: Colors.brown);
    }
  }
}
