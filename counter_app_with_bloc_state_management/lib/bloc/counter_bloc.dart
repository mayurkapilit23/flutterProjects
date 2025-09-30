import 'package:counter_app_with_bloc_state_management/bloc/counter_events.dart';
import 'package:counter_app_with_bloc_state_management/bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialState()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterStates(counter: state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterStates(counter: state.counter - 1));
    });
  }
}
