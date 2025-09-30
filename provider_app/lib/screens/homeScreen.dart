import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/textProvider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateOfInterestController =
      TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  double? interest;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TextProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _principalController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Principal',
                ),
                onChanged: (value) {
                  provider.updatePrincipal(value);
                },
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _rateOfInterestController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Rate of Interest',
                ),
                onChanged: (value) {
                  provider.updateRateOfInterest(value);
                },
              ),
            ),

            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _yearsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'years',
                ),
                onChanged: (value) {
                  provider.updateYears(value);
                },
              ),
            ),

            SizedBox(height: 10),
            // Text('Interest :${provider.text} '),
            Text(
              provider.interest == null ? '' : 'Interest: ${provider.interest}',
            ),
            SizedBox(height: 10),
            Transform(
              transform: Matrix4.rotationZ(45 * (pi / 180.0)),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  provider.calculateInterest();
                },
                child: Text("Calculate"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
