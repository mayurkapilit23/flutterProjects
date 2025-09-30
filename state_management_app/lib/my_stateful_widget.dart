import 'package:flutter/cupertino.dart';

class ExampleStatefulPage extends StatefulWidget {
  const ExampleStatefulPage({super.key});

  @override
  State<ExampleStatefulPage> createState() => _ExampleStatefulPageState();
}

class _ExampleStatefulPageState extends State<ExampleStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('Child Widget builds');

    return Container();
  }
}
