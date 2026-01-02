import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/cubits/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(0));

  void increment() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 2));
    emit(CounterError("Internet connection failed", state.number));
    // emit(CounterCounted(state.number + 1));
  }

  void decrement() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 2));
    emit(CounterCounted(state.number - 1));
  }
}
