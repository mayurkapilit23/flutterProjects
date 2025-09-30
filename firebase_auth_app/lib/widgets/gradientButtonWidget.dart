import 'package:flutter/material.dart';

class GradientButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GradientButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Return a Material widget with a circular border radius
    return Material(
      borderRadius: BorderRadius.circular(8),
      // Create an InkWell widget with an onTap function and a circular border radius
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        // Set the splash color to a semi-transparent white
        splashColor: Colors.white.withOpacity(0.3),
        // Create an Ink widget with padding and a gradient background
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // Create a linear gradient with blue and purple colors
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Center the text within the Ink widget
          child: Center(
            // Create a Text widget with white text color, bold font weight, and font size of 16
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
