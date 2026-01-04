import 'package:flutter/material.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import 'package:todo_cubit/logic/user/user_cubit.dart';
import 'package:todo_cubit/presentation/screens/todo_details.dart';
import 'package:todo_cubit/presentation/screens/todos_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => UserCubit()),
        BlocProvider(
          create: (ctx) => TodoCubit(userCubit: ctx.read<UserCubit>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO CUBIT',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        initialRoute: '/',
        routes: {
          '/': (context) => const TodosScreen(),
          '/todo-details': (context) => const TodoDetailsScreen(),
        },
      ),
    );
  }
}
