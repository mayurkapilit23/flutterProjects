import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,

    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Change this color
            width: 2.0,
          ),
        ),

        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
