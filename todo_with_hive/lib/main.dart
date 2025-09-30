import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:todo_with_hive/todo_page.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();
  //open box
  var box=await Hive.openBox('MY_BOX');
  // await box.clear();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoPage(),debugShowCheckedModeBanner: false,);
  }
}
