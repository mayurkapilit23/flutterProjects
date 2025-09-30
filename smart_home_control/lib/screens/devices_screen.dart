import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'ProHome',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          colors: [Colors.purple, Colors.deepPurple, Colors.deepPurpleAccent],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xff132D20),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.electric_bolt,
                      color: Color(0xff60DCA0),
                      size: 50,
                    ),
                    Text(
                      '84.8 kWh',
                      style: TextStyle(color: Color(0xff60DCA0), fontSize: 25),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Linked Devices',
                    style: TextStyle(color: Color(0xffA6A6A6)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(color: Color(0xff696969)),
                    ),
                  ),
                ],
              ),

              //devices container
              Container(
                padding: EdgeInsets.all(20),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  color: Color(0xff212121),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Night Light',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Night Light',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.light, color: Colors.white, size: 50),

                        Switch(value: true, onChanged: (value) {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
