import 'package:flutter/material.dart';
import 'package:practice_flutter/flutter_learning/simple_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const projectUrl = 'https://wbwkbzapnmplpsdplwtx.supabase.co';
  const anonKey ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indid2tiemFwbm1wbHBzZHBsd3R4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI2NTg3MTUsImV4cCI6MjA2ODIzNDcxNX0.E-cMW37NDyFjGEH5qN0t6HWvMo1zpPJa-nlJyx7N34U';
  await Supabase.initialize(url: projectUrl, anonKey: anonKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Georgia '
      ),
        debugShowCheckedModeBanner: false, home: SimpleText());
  }
}
