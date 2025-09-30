import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_app/model/products.dart';

class ProductService {
  static const String _baseUrl = 'https://fakestoreapi.in/api/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
