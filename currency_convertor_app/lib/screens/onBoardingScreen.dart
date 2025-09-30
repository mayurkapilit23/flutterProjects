import 'package:currency_convertor_app/screens/homeScreen.dart';
import 'package:currency_convertor_app/widgets/textWithPositionedWidget.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffe3e0ff);

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 30,
              child: Text(
                'Why to choose Flutter ???',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            TextWithPositionedWidget(
              radians: 19.0,
              color: Colors.redAccent,
              height: 35.0,
              width: 130.0,
              right: 20.0,
              top: 100.0,
              text: 'Open Source',
              fontSize: 18.0,
            ),

            TextWithPositionedWidget(
              radians: -0.15,
              color: Colors.green,
              height: 35.0,
              width: 300.0,
              right: -20.0,
              bottom: 50.0,
              text: 'Reduced Development Costs',
              fontSize: 18.0,
            ),

            Positioned(
              bottom: 250,
              right: 50,

              child: Container(
                width: 300,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor,
                ),
                child: Image.asset('assets/pngs/model2.png', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 220,
              right: 50,

              child: Image.asset('assets/icons/flutter.png'),
            ),

            TextWithPositionedWidget(
              radians: 0.2,
              color: Colors.purple,
              height: 35.0,
              width: 200.0,
              left: 30.0,
              top: 300.0,
              text: 'Single Codebase',
              fontSize: 18.0,
            ),
            TextWithPositionedWidget(
              radians: -0.10,
              color: Colors.orange,
              height: 35.0,
              width: 200.0,
              left: 20.0,
              top: 150.0,
              text: 'Fast Development',
              fontSize: 18.0,
            ),
            TextWithPositionedWidget(
              radians: -0.25,
              color: Colors.blue,
              height: 35.0,
              width: 300.0,
              left: 0.0,
              bottom: 200.0,
              text: 'Cross-Platform Development',
              fontSize: 18.0,
            ),

            Positioned(
              left: 110,
              bottom: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

                },
                child: Row(
                  children: [
                    Text('Get Started', style: TextStyle(color: Colors.white)),
                    Icon(
                      Icons.arrow_right_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
