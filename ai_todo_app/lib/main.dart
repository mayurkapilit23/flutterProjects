// main.dart
import 'package:ai_todo_app/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AI ToDo App',
        theme: ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  bool _loadingSuggestions = false;
  String _summary = "";

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI ToDo App'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Add a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoProvider.addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Suggest tasks button
            ElevatedButton(
              onPressed: _loadingSuggestions
                  ? null
                  : () async {
                      setState(() => _loadingSuggestions = true);
                      try {
                        final suggestions = await todoProvider.suggestTasks(
                          "Give 5 todo tasks for a productive day",
                        );
                        for (var s in suggestions) {
                          todoProvider.addTodo(s);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                      setState(() => _loadingSuggestions = false);
                    },
              child: _loadingSuggestions
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Suggest Tasks (AI)'),
            ),
            const SizedBox(height: 16),
            // Task List
            Expanded(
              child: ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) {
                  final todo = todoProvider.todos[index];
                  return ListTile(
                    title: Text(
                      todo.task,
                      style: TextStyle(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) => todoProvider.toggleTodo(index),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => todoProvider.removeTodo(index),
                    ),
                  );
                },
              ),
            ),
            // Summarize button
            ElevatedButton(
              onPressed: () async {
                final summary = await todoProvider.summarizeTasks();
                setState(() => _summary = summary);
              },
              child: const Text('Summarize Tasks (AI)'),
            ),
            const SizedBox(height: 8),
            if (_summary.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.orange.shade100,
                child: Text(_summary),
              ),
          ],
        ),
      ),
    );
  }
}
