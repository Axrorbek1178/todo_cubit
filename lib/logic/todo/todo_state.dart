part of 'todo_cubit.dart';

@immutable
class TodoState {
  final List<Todo> todos;
  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  final List<Todo> todos;

  const TodoInitial(this.todos) : super(todos);
}

class TodoAdded extends TodoState {
  const TodoAdded(List<Todo> todos) : super(todos);
}

class TodoToggled extends TodoState {
  const TodoToggled(List<Todo> todos) : super(todos);
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message, List<Todo> todos) : super(todos);
}

class TodoDeleted extends TodoState {
  const TodoDeleted(List<Todo> todos) : super(todos);
}

class TodoEdited extends TodoState {
  const TodoEdited(List<Todo> todos) : super(todos);
}
