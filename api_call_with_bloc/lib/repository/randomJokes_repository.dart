import 'dart:convert';

import 'package:api_call_with_bloc/model/randomJokesModel.dart';
import 'package:http/http.dart' as http;

class RandomJokesRepository {
  final String _api_url = "https://official-joke-api.appspot.com/random_joke";

  Future<RandomJokes> fetchRandomJokes() async {
    final response = await http.get(Uri.parse(_api_url));
    if (response.statusCode == 200) {
      print("Repository : jsondecode : ${jsonDecode(response.body)}");
      return RandomJokes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load random jokes');
    }
  }
}
