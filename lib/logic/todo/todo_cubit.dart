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
      final todos = state.todos;
      todos.add(todo);
      emit(TodoAdded(todos));
      emit(TodoState(todos));
    } catch (e) {
      emit(TodoError("Error occurred", state.todos));
    }
  }

  void editTodo(Todo todo) {
    try {
      final todos = state.todos;
      final index = todos.indexWhere((t) => t.id == todo.id);
      todos[index] = todo;
      emit(TodoEdited(todos));
      emit(TodoState(todos));
    } catch (e) {
      emit(TodoError("Error occurred", state.todos));
    }
  }

  void toggleTodo(String id) {
    final todos = state.todos;
    final index = todos.indexWhere((t) => t.id == id);
    todos[index].isDone = !todos[index].isDone;
    emit(TodoToggled(todos));
    emit(TodoState(todos));
  }

  void deleteTodo(String id) {
    final todos = state.todos;
    todos.removeWhere((todo) => todo.id == id);
    emit(TodoDeleted(todos));
    emit(TodoState(todos));
  }
}
