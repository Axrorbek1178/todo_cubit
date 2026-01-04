import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import 'package:todo_cubit/presentation/widgets/manage_todo.dart';
import 'package:todo_cubit/presentation/widgets/todo_list_item.dart';
import 'package:todo_cubit/presentation/widgets/search_bar.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  var _init = false;
  @override
  void didChangeDependencies() {
    if (!_init) {
      context.read<TodoCubit>().getTodos();
    }
    _init = true;
    super.didChangeDependencies();
  }

  void openManageTodo(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) => ManageTodo(),
    );
  }

  void openSearchBar(BuildContext context) {
    showSearch(context: context, delegate: SearchBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todos Screen"),
        actions: [
          IconButton(
            onPressed: () => openSearchBar(context),
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              openManageTodo(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos!.length,
            itemBuilder: (context, index) =>
                TodoListItem(todo: state.todos![index]),
          );
        },
      ),
    );
  }
}
