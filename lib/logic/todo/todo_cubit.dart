import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:todo_cubit/data/models/todo.dart';
import 'package:todo_cubit/logic/user/user_cubit.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final UserCubit userCubit;
  TodoCubit({required this.userCubit})
    : super(
        TodoInitial([
          Todo(
            id: UniqueKey().toString(),
            title: "First Todo",
            isDone: false,
            userId: 'user1',
          ),
          Todo(
            id: UniqueKey().toString(),
            title: "Second Todo",
            isDone: true,
            userId: 'user1',
          ),
          Todo(
            id: UniqueKey().toString(),
            title: "Go Shopping",
            isDone: false,
            userId: 'user2',
          ),
        ]),
      );

  void getTodos() {
    // should filter by userId
    final user = userCubit.currentUser;
    final todos = state.todos!.where((todo) => todo.userId == user.id).toList();
    emit(TodoState(todos: todos));
  }

  void addTodo(String title) {
    final user = userCubit.currentUser;

    try {
      final todo = Todo(
        id: UniqueKey().toString(),
        title: title,
        userId: user.id,
      );
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
          return Todo(id: id, title: title, isDone: t.isDone, userId: t.userId);
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
        return Todo(
          id: todo.id,
          title: todo.title,
          isDone: !todo.isDone,
          userId: todo.userId,
        );
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
