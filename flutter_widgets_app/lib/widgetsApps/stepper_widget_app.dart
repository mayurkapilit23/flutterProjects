import 'package:flutter/material.dart';

class StepperWidgetApp extends StatefulWidget {
  const StepperWidgetApp({super.key});

  @override
  State<StepperWidgetApp> createState() => _StepperWidgetAppState();
}

class _StepperWidgetAppState extends State<StepperWidgetApp> {
  int _currentStep = 0;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stepper(
              type: StepperType.vertical,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,

              steps: [
                Step(
                  title: Text('Account'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email Address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('Address'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Home Address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Postcode'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('Mobile no'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
