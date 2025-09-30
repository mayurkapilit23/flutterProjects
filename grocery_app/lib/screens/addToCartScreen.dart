import 'package:flutter/material.dart';

class Fruit {
  final String name;
  final String image;
  final double price;
  int quantity;

  Fruit({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 0,
  });
}

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  List<Fruit> fruits = [
    Fruit(name: "Apple", image: "assets/apple.png", price: 1.99),
    Fruit(name: "Banana", image: "assets/banana.png", price: 0.99),
    Fruit(name: "Orange", image: "assets/orange.png", price: 1.49),
    Fruit(name: "Grapes", image: "assets/grapes.png", price: 2.99),
    Fruit(name: "Mango", image: "assets/mango.png", price: 3.49),
    Fruit(name: "Strawberry", image: "assets/strawberry.png", price: 4.99),
  ];

  double get totalPrice {
    return fruits.fold(0, (sum, fruit) => sum + (fruit.price * fruit.quantity));
  }

  int get totalItems {
    return fruits.fold(0, (sum, fruit) => sum + fruit.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Market'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to cart screen
                },
              ),
              if (totalItems > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      totalItems.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return FruitCard(
                  fruit: fruits[index],
                  onAdd: () {
                    setState(() {
                      fruits[index].quantity++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      if (fruits[index].quantity > 0) {
                        fruits[index].quantity--;
                      }
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.green)),
              color: Colors.green[50],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: totalItems > 0
                      ? () {
                          // Proceed to checkout
                        }
                      : null,
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final Fruit fruit;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const FruitCard({super.key,
    required this.fruit,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  fruit.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              fruit.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${fruit.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 14, color: Colors.green[700]),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: fruit.quantity > 0 ? onRemove : null,
                  color: Colors.red,
                ),
                Text(fruit.quantity.toString(), style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onAdd,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
