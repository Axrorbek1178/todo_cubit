import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/blocs/counter/counter_bloc.dart';
import 'package:todo_cubit/logic/cubits/counter/counter_cubit.dart';
import 'package:todo_cubit/presentation/screens/bloc_counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (ctx) => CounterBloc()),
        BlocProvider<CounterCubit>(create: (ctx) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const BlocCounterScreen(),
      ),
    );
  }
}
