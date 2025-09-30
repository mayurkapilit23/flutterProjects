import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/providers.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final text = ref.watch(normalProvider);
    final count = ref.watch(counter);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(text, style: TextStyle(fontSize: 30)),
              Text('Total : $count', style: TextStyle(fontSize: 30)),

              Text('Text : $text'),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          writeData(count.toString());
          text = ('text');
          ref.read(counter.notifier).state++;
        },
      ),
    );
  }
}
