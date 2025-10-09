// providers/todo_provider.dart
import 'dart:convert';

import 'package:ai_todo_app/task_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  final String _huggingFaceToken = "YOUR_HUGGINGFACE_API_TOKEN"; // Free token

  void addTodo(String task) {
    _todos.add(Todo(task: task));
    notifyListeners();
  }

  void toggleTodo(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  /// Call Hugging Face API to suggest tasks
  Future<List<String>> suggestTasks(String prompt) async {
    final url = Uri.parse(
      'https://api-inference.huggingface.co/models/gpt2',
    ); // Free text-gen model
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_huggingFaceToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "inputs": prompt,
        "parameters": {"max_new_tokens": 50},
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // The generated text is usually in data[0]['generated_text']
      final text = data[0]['generated_text'] as String;
      // Split by newlines or commas for multiple tasks
      return text
          .split(RegExp(r'\n|,'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    } else {
      throw Exception("Failed to fetch suggestions");
    }
  }

  /// Summarize tasks using Hugging Face
  Future<String> summarizeTasks() async {
    final prompt =
        "Summarize the following tasks:\n${_todos.map((t) => "- ${t.task}").join('\n')}";
    final url = Uri.parse(
      'https://api-inference.huggingface.co/models/facebook/bart-large-cnn',
    ); // Free summarization model

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_huggingFaceToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "inputs": prompt,
        "parameters": {"max_length": 60},
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data[0]['summary_text'] ?? "No summary available";
    } else {
      return "Failed to summarize tasks";
    }
  }
}
