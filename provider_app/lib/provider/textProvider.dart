import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  String _principal = '';
  String _rateOfInterest = '';
  String _years = '';

  double? _interest;

  double? get interest => _interest;

  String get text1 => _principal;

  String get text2 => _rateOfInterest;

  String get tex3 => _years;

  void updatePrincipal(String newText) {
    _principal = newText;
    notifyListeners();
  }

  void updateRateOfInterest(String newText) {
    _rateOfInterest = newText;
    notifyListeners();
  }

  void updateYears(String newText) {
    _years = newText;
    notifyListeners();
  }

  void calculateInterest() {
    try {
      final p = double.parse(_principal);
      final r = double.parse(_rateOfInterest);
      final t = double.parse(_years);
      _interest = (p * r * t) / 100;
    } catch (e) {
      _interest = null; // In case of bad input
    }
    notifyListeners();
  }
}
