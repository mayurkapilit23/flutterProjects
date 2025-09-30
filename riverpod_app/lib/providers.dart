import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final normalProvider = Provider<String>((ref) => 'Hello with Riverpod');
final counter = StateProvider<int>((ref) => 0);

void writeData(String text) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('text', text);
}

Future<String?> readData(text) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  return preferences.getString(text);
}
