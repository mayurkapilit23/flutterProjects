abstract class CounterState {
  final int counter;

  CounterState(this.counter);
}

class InitialCounterState extends CounterState {
  InitialCounterState() : super(0);
}

class UpdatedCounterState extends CounterState {
  UpdatedCounterState(super.newCounter);
}
