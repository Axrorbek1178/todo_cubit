import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import 'package:todo_cubit/presentation/screens/todo_details.dart';

class SearchBar extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          query = '';
        },
        child: Text("CLEAR"),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final todos = context.read<TodoCubit>().searchTodos(query);
    return todos.isEmpty
        ? Center(child: Text('Can not find any todos'))
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.of(
                context,
              ).pushNamed('/todo-details', arguments: todos[index]),
              title: Text(todos[index].title),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      final todos = context.read<TodoCubit>().searchTodos(query);
      return todos.isEmpty
          ? Center(child: Text('Can not find any todos'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => Navigator.of(
                  context,
                ).pushNamed('/todo-details', arguments: todos[index]),
                title: Text(todos[index].title),
              ),
            );
    }
    return Container();
  }
}
