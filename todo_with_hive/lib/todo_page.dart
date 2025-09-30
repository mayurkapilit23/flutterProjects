import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_ce/hive.dart';
import 'package:toast/toast.dart';
import 'package:todo_with_hive/todoList.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _myBox = Hive.box('MY_BOX');
  final TextEditingController todoController = TextEditingController();

  List<TodoItem> todoList = [];

  @override
  void initState() {
    super.initState();
    ToastContext().init(context);
    loadFromDatabase();
  }

  void loadFromDatabase() {
    List<dynamic>? rawList = _myBox.get('TODO_LIST');
    if (rawList != null) {
      todoList = rawList
          .map((e) => TodoItem.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    }
  }

  void saveToDatabase() {
    List<Map<String, dynamic>> mappedList = todoList
        .map((e) => e.toMap())
        .toList();
    _myBox.put('TODO_LIST', mappedList);
  }

  void addTask() {
    String todoText = todoController.text.trim();
    if (todoText.isEmpty) return;

    setState(() {
      todoList.add(TodoItem(task: todoText));
      todoController.clear();
    });
    saveToDatabase();
    Navigator.pop(context);
    Toast.show("Task added");
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
    saveToDatabase();
    Toast.show("Task deleted");
  }

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add new task"),
          content: TextField(
            controller: todoController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                todoController.clear();
              },
              child: const Text("Cancel"),
            ),
            TextButton(onPressed: addTask, child: const Text("Add")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: todoList.isEmpty
          ? const Center(child: Text("No tasks yet."))
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                TodoItem item = todoList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Checkbox(
                      value: item.isDone,
                      onChanged: (bool? value) {
                        setState(() {
                          item.isDone = value!;
                        });
                        saveToDatabase();
                      },
                    ),
                    title: Text(
                      item.task,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        decoration: item.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteTask(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
