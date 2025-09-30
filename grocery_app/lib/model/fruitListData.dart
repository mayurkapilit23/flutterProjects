import 'package:flutter/material.dart';
import 'package:grocery_app/model/fruits.dart';

class FruitListData {
  List<Fruits> fruits = [
    Fruits(
      name: "Apple",
      image: "assets/icons/apple.png",
      color: Color(0xffffd03a),
      price: 1.99,
      description:
          "Crisp, sweet apples with a perfect balance of tartness. Our fresh-picked apples "
          "are rich in fiber and antioxidants. Ideal for snacking, baking into pies, or making "
          "homemade applesauce. Grown in sustainable orchards for maximum flavor and freshness.",
    ),
    Fruits(
      name: "Blueberry",
      image: "assets/icons/blueberry.png",
      color: Color(0xffffd03a),
      price: 3.49,
      description:
          "Plump, juicy blueberries bursting with sweet flavor and packed with antioxidants. "
          "These nutrient-dense berries are perfect for smoothies, pancakes, or eating by the handful. "
          "Hand-picked at peak ripeness to ensure the best taste and nutritional value.",
    ),
    Fruits(
      name: "Mango",
      image: "assets/icons/mango.png",
      color: Color(0xffffd03a),
      price: 2.29,
      description:
          "Sweet, tropical mangoes with smooth, buttery texture. Known as the 'king of fruits', "
          "our mangoes are rich in vitamins A and C. Enjoy them fresh, in smoothies, or as a delicious "
          "addition to salsas and salads. Each mango is tree-ripened for maximum sweetness.",
    ),
    Fruits(
      name: "Orange",
      image: "assets/icons/orange.png",
      color: Color(0xffffd03a),
      price: 0.99,
      description:
          "Juicy, vitamin C-packed oranges with bright, citrusy flavor. Perfect for fresh-squeezed "
          "juice, snacking, or adding zest to recipes. Our oranges are carefully selected for their thin skin "
          "and high juice content. A refreshing boost of immunity-supporting nutrients.",
    ),
    Fruits(
      name: "Lemon",
      image: "assets/icons/lemon.png",
      color: Color(0xffffd03a),
      price: 0.79,
      description:
          "Tangy, aromatic lemons with vibrant yellow skin. These versatile citrus fruits are "
          "perfect for adding zest to dishes, making lemonade, or garnishing drinks. High in vitamin C "
          "and known for their cleansing properties. Each lemon is bursting with fresh, citrusy juice.",
    ),
    Fruits(
      name: "Pineapple",
      image: "assets/icons/pineapple.png",
      color: Color(0xffffd03a),
      price: 2.99,
      description:
          "Sweet and slightly tart pineapple with golden yellow flesh. This tropical favorite "
          "contains bromelain, a digestive enzyme. Enjoy it fresh, grilled, or in fruit salads. Our "
          "pineapples are harvested at peak ripeness for perfect sweetness and juiciness.",
    ),
  ];
}
