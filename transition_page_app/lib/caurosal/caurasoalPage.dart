import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transition_page_app/caurosal/image.dart';

class CaurasoalPage extends StatelessWidget {
  const CaurasoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: ImagesClass().fruits.map((fruit) {
            return Builder(
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 0),
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          fruit['name']!,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Flexible(
                          child: Image.network(
                            fruit['image']!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
