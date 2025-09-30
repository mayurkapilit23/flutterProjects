import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_data/models/pizza.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String pizzaString = '';

  

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: readJsonFile(),
          builder: (context, pizza) {
            return ListView.builder(
              itemCount: (pizza.data == null) ? 0 : pizza.data?.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text('${pizza.data?[index].pizzaName}'),
                  subtitle: Text('${pizza.data?[index].description}'),
                  trailing: Text('${pizza.data?[index].price} rs'),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');

    List myMap = jsonDecode(myString);

    List<Pizza> myPizzas = [];

    for (var pizza in myMap) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    return myPizzas;
  }
}
