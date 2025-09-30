import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  var _todoText = TextEditingController();
  var todo = "";
  List<String> todoList = ["drink"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todo = _todoText.text.toString();
          todoList.add(todo);
          for (var i = 0; i < todoList.length; i++) {
            print(todoList[i]);
          }

          setState(() {});
          _todoText.clear();

          _modalBottomSheetMenu(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(
          child: Text("Todo App", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Column(children: [Text('Hello', textAlign: TextAlign.center)]),
      ),
    );
  }
}

void _modalBottomSheetMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (builder) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title *",
                  style: GoogleFonts.workSans(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextField(
                  // controller: _titleController,
                  decoration: InputDecoration(
                    hintText: "Write up chemistry lab report",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Description (Optional)",
                  style: GoogleFonts.workSans(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextField(
                  // controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                Text(
                  "Deadline *",
                  style: GoogleFonts.workSans(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  // onTap: _pickDate,
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        // hintText: _selectedDate == null
                        //     ? 'Select deadline';
                        // : DateFormat('dd MMMM yyyy').format(_selectedDate!),
                        // suffixIcon: Icon(Icons.calendar_today),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Add Task",
                      style: GoogleFonts.workSans(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
    },
  );
}
