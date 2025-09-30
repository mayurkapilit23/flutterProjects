import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/fruitsListViewWidget.dart';
import 'package:grocery_app/widgets/carouselSliderWidget.dart';

import '../model/fruitListData.dart';

FruitListData fruitListData = FruitListData();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/fruitSearchScreen');
                        },
                        icon: Icon(Icons.search),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/addToCardScreen');
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              CarouselSliderWidget(),
              const SizedBox(height: 20),
              Text(
                'Best Seller',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              // ListView.builder for fruits
              FruitsListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
