part of 'todo_cubit.dart';

@immutable
class TodoState {
  final List<Todo>? todos;
  const TodoState({this.todos});
}

final class TodoInitial extends TodoState {
  final List<Todo> todos;

  const TodoInitial(this.todos) : super();
}

class TodoAdded extends TodoState {}

class TodoToggled extends TodoState {}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
}

class TodoDeleted extends TodoState {}

class TodoEdited extends TodoState {}
