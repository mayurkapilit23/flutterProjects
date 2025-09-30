import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/fruitListData.dart';

FruitListData fruitListData = FruitListData();

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: fruitListData.fruits.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final fruit=fruitListData.fruits[itemIndex];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(fruit.image),
          ),
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
