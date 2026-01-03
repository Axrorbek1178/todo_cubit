import 'package:flutter/material.dart';
import 'package:todo_cubit/data/models/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  const TodoListItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(todo.isDone ? Icons.check_circle : Icons.circle_outlined),
      title: Text(todo.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}
