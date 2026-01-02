abstract class CounterState {
  final int number;
  CounterState(this.number);
}

class CounterInitial extends CounterState {
  CounterInitial(int number) : super(number);
}

class CounterLoading extends CounterState {
  CounterLoading(int number) : super(number);
}

class CounterCounted extends CounterState {
  final int counter;
  CounterCounted(this.counter) : super(counter);
}

class CounterError extends CounterState {
  final String message;
  CounterError(this.message, int number) : super(number);
}
