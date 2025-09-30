import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/appColors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Fruits",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enjoy fresh fruits",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.white),
              ),
              Image.asset("assets/images/fruits.png"),
               SizedBox(height: MediaQuery.of(context).size.height*0.1 ),
             SizedBox(
               width: MediaQuery.of(context).size.width*0.8,
               child:  ElevatedButton(
                 onPressed: () {
                   Navigator.pushNamed(context, '/homeScreen');
                 },
                 child: const Text("Get Started",style: TextStyle(color: Colors.black),),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
