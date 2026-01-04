import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:todo_cubit/data/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
    : super(
        TodoInitial([
          Todo(id: UniqueKey().toString(), title: "First Todo", isDone: false),
          Todo(id: UniqueKey().toString(), title: "Second Todo", isDone: true),
          Todo(id: UniqueKey().toString(), title: "Go Shopping", isDone: false),
        ]),
      );

  void addTodo(String title) {
    try {
      final todo = Todo(id: UniqueKey().toString(), title: title);
      final todos = [...state.todos!, todo];
      emit(TodoAdded());
      emit(TodoState(todos: todos));
    } catch (e) {
      emit(TodoError("Error occurred"));
    }
  }

  void editTodo(String id, String title) {
    try {
      final todos = state.todos!.map((t) {
        if (t.id == id) {
          return Todo(id: id, title: title, isDone: t.isDone);
        }
        return t;
      }).toList();
      emit(TodoEdited());
      emit(TodoState(todos: todos));
    } catch (e) {
      emit(TodoError("Error occurred"));
    }
  }

  void toggleTodo(String id) {
    final todos = state.todos!.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, title: todo.title, isDone: !todo.isDone);
      }
      return todo;
    }).toList();
    emit(TodoToggled());
    emit(TodoState(todos: todos));
  }

  void deleteTodo(String id) {
    final todos = state.todos;
    todos!.removeWhere((todo) => todo.id == id);
    emit(TodoDeleted());
    emit(TodoState(todos: todos));
  }

  List<Todo> searchTodos(String title) {
    return state.todos!
        .where((todo) => todo.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }
}
