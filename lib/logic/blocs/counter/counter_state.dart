part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int number;
  const CounterState(this.number);
}

class CounterInitial extends CounterState {
  const CounterInitial(int number) : super(number);
}

class CounterLoading extends CounterState {
  const CounterLoading(int number) : super(number);
}

class CounterCounted extends CounterState {
  final int counter;
  const CounterCounted(this.counter) : super(counter);
}

class CounterError extends CounterState {
  final String message;
  const CounterError(this.message, int number) : super(number);
}
