import 'package:bloc_app1/bloc/counter_bloc.dart';
import 'package:bloc_app1/bloc/counter_event.dart';
import 'package:bloc_app1/bloc/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: BlocProvider(
        create: (_) => CounterBloc(), child: CounterPage())));
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is InitialCounterState) {
          return _Counter(context, 0);
        } else if (state is UpdatedCounterState) {
          return _Counter(context, state.counter);
        } else {
          return Container();
        }
      },
    );
  }
}

Widget _Counter(BuildContext context, int counter) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Counter : $counter'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(Increment());
              },
              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(Decrement());
              },
              child: Text("-"),
            ),
          ],
        ),
      ],
    ),
  );
}
