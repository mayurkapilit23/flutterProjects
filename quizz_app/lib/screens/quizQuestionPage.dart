import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/screens/resultScreen.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({super.key});

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  List<Map<String, dynamic>> flutterQuiz = [
    {
      "question": "Flutter is a framework developed by Microsoft.",
      "answer": false,
    },
    {"question": "Flutter uses the Dart programming language.", "answer": true},
    {
      "question": "Flutter can only be used for mobile app development.",
      "answer": false,
    },
    {
      "question":
          "The StatelessWidget in Flutter can hold state and change over time.",
      "answer": false,
    },
    {
      "question":
          "Flutter provides a single codebase for building apps on multiple platforms.",
      "answer": true,
    },
    {"question": "Widgets in Flutter are immutable.", "answer": true},
    {
      "question":
          "Flutter’s UI components are rendered using native platform widgets.",
      "answer": false,
    },
    {
      "question": "Flutter supports hot reload for fast UI development.",
      "answer": true,
    },
    {
      "question":
          "Flutter apps are compiled to native ARM code for optimized performance.",
      "answer": true,
    },
    {
      "question":
          "Material Design is the only UI design system supported by Flutter.",
      "answer": false,
    },
  ];

  List<Icon> scoreRecorder = [];
  int currentQuestionIndex = 0;
  var totalCorrectAnswer = 0;
  int totalWrongAnswer = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = flutterQuiz[currentQuestionIndex]["answer"];

    setState(() {
      if (userAnswer == correctAnswer) {
        totalCorrectAnswer++;
        scoreRecorder.add(Icon(Icons.check, color: Colors.green));
      } else {
        totalWrongAnswer++;
        scoreRecorder.add(Icon(Icons.close, color: Colors.red));
      }

      if (currentQuestionIndex < flutterQuiz.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz finished
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ResultScreen(
        //       totalCorrectAnswer: totalCorrectAnswer,
        //       totalWrongAnswer: totalWrongAnswer,
        //     ),
        //   ),
        // );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              totalCorrectAnswer: totalCorrectAnswer,
              totalWrongAnswer: totalWrongAnswer,
            ),
          ),
        ).then((_) {
          setState(() {
            currentQuestionIndex = 0;
            totalCorrectAnswer = 0;
            totalWrongAnswer = 0;
            scoreRecorder.clear();
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: scoreRecorder),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "[${currentQuestionIndex + 1}] ${flutterQuiz[currentQuestionIndex]["question"]}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.green,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () => checkAnswer(true),
                    child: Text(
                      "True",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Colors.red),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () => checkAnswer(false),
                    child: Text(
                      "False",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
