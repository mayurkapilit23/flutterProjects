import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/modules/login/bloc/login_bloc.dart';
import 'package:login_register_app/modules/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => LoginBloc(), child: LoginScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}
