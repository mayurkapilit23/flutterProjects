import 'package:flutter/material.dart';
import 'package:grocery_app/model/fruitListData.dart';
import 'package:grocery_app/screens/fruitDetailsScreen.dart';

FruitListData fruitListData = FruitListData();

class FruitsListViewWidget extends StatelessWidget {
  const FruitsListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: fruitListData.fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruitListData.fruits[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FruitDetailsScreen(index: index, fruit: null,),
                ),
              );
            },
            child: Card(
              color: fruit.color,
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Fruit image with rounded corners
                    Hero(
                      tag: 'fruit',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          fruit.image,
                          width: 80,
                          height: 80,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Fruit details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fruit.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${fruit.price.toStringAsFixed(2)}',

                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Add to cart button
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        // Add to cart functionality
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
