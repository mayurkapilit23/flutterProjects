class TodoItem {
  String task;
  bool isDone;

  TodoItem({required this.task, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {'task': task, 'isDone': isDone};
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      task: map['task'],
      isDone: map['isDone'],
    );
  }
}
