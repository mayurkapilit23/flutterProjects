import 'package:bloc_app1/bloc/counter_event.dart';
import 'package:bloc_app1/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  int count = 0;

  CounterBloc() : super(InitialCounterState()) {
    on<Increment>((event, emit) {
      count = count + 1;
      emit(UpdatedCounterState(count));
    });

    on<Decrement>((event, emit) {
      count = count - 1;
      emit(UpdatedCounterState(count));
    });
  }
}
