import 'package:flutter/material.dart';

import '../model/fruitListData.dart';
import '../model/fruits.dart';
import 'fruitDetailsScreen.dart';

class FruitSearchScreen extends StatefulWidget {
  const FruitSearchScreen({super.key});

  @override
  _FruitSearchScreenState createState() => _FruitSearchScreenState();
}

class _FruitSearchScreenState extends State<FruitSearchScreen> {
  late List<Fruits> filteredFruits;
  final TextEditingController searchController = TextEditingController();
  final FruitListData fruitListData = FruitListData();

  @override
  void initState() {
    super.initState();
    filteredFruits = List<Fruits>.from(fruitListData.fruits);
  }

  void filterFruits(String query) {
    setState(() {
      filteredFruits = fruitListData.fruits.where((fruit) {
        final name = fruit.name.toLowerCase();
        final description = fruit.description.toLowerCase();
        final searchQuery = query.toLowerCase();
        return name.contains(searchQuery) || description.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Fruits'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search fruits...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
              onChanged: filterFruits,
            ),
          ),
          Expanded(
            child: filteredFruits.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No fruits found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: filteredFruits.length,
              itemBuilder: (context, index) {
                final fruit = filteredFruits[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FruitDetailsScreen(fruit: fruit),
                        ),
                      );
                    },
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: fruit.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Image.asset(
                          fruit.image,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    title: Text(
                      fruit.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$${fruit.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.green.shade700,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}