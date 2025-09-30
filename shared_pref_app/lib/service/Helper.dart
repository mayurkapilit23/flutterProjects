import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static Future<bool> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
   return await prefs.setString(key, value);
  }

  static Future<String?> getData(String key)async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);

  }
}
