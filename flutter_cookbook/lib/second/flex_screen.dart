import 'package:flutter/material.dart';
import 'package:flutter_cookbook/second/helper%20widgets/labeled_container.dart';

class FlexScreen extends StatelessWidget {
  const FlexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flexible & Expanded')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._header(context, 'Expanded'),
            _buildExpanded(context),
            ..._header(context, 'Flexible'),
            _buildFlexible(context),
            Expanded(child: Container()),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }
}

Iterable<Widget> _header(BuildContext context, String text) {
  return [
    SizedBox(height: 20),
    Text(text, style: Theme.of(context).textTheme.headlineSmall),
  ];
}

Widget _buildExpanded(BuildContext context) {
  return SizedBox(
    height: 100.0,
    child: Row(
      children: [
        LabeledContainer(
          width: 100.0,
          color: Colors.green,
          text: '100',
          textColor: Colors.black,
        ),
        Expanded(
          child: LabeledContainer(
            color: Colors.purple,
            text: 'The Remainder',
            textColor: Colors.black,
          ),
        ),
        LabeledContainer(
          width: 40.0,
          color: Colors.green,
          text: '40',

          textColor: Colors.black,
        ),
      ],
    ),
  );
}

Widget _buildFlexible(BuildContext context) {
  return SizedBox(
    height: 100,
    child: Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: LabeledContainer(
            color: Colors.orange,
            text: '25%',

            textColor: Colors.black,
          ),
        ),
        Flexible(
          flex: 1,
          child: LabeledContainer(
            color: Colors.deepOrange,
            text: '25%',

            textColor: Colors.black,
          ),
        ),
        Flexible(
          flex: 2,
          child: LabeledContainer(
            color: Colors.blue,
            text: '50%',

            textColor: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooter(BuildContext context) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(40),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
        child: Text(
          'Pinned to the Bottom',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    ),
  );
}
