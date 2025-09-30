import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  final int totalCorrectAnswer;
  final int totalWrongAnswer;

  const ResultScreen({
    super.key,
    required this.totalCorrectAnswer,
    required this.totalWrongAnswer,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🎉 Quiz Completed!",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "✅ Correct Answers: ${widget.totalCorrectAnswer}",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 10),
              Text(
                "❌ Wrong Answers: ${widget.totalWrongAnswer}",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.red),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to quiz
                  int correct = int.parse(widget.totalCorrectAnswer.toString());
                  print(correct);
                  int wrong = int.parse(widget.totalWrongAnswer.toString());
                  print(wrong);
                },
                child: Text(
                  "Restart Quiz",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
