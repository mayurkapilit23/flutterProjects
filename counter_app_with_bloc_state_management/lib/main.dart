import 'package:counter_app_with_bloc_state_management/bloc/counter_bloc.dart';
import 'package:counter_app_with_bloc_state_management/bloc/counter_events.dart';
import 'package:counter_app_with_bloc_state_management/bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc,CounterStates>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Counter: ${BlocProvider.of<CounterBloc>(context).state.counter}',
                ),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(
                          context,
                        ).add(IncrementEvent());
                      },
                      child: Text("Increment"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(
                          context,
                        ).add(DecrementEvent());
                      },
                      child: Text("Decrement"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
