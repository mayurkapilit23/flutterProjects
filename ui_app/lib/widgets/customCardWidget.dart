
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 300,
          width: 250,
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.asset(
                    'assets/images/nike.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Air Jordan 1 Mid 'Smoke Grey'",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Own the Style', style: TextStyle(color: Colors.grey)),
                    Flexible(
                      child: Text(
                        'Step back into classic hoops style with a durable leather',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('156'), Text('Buy Now')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
