import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return Text(asyncSnapshot.data ?? 'Null data');
                  } else {
                    return Text('no data');
                  }
                },
              ),

              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return Text(asyncSnapshot.data ?? '');
                  } else {
                    return Text('no data');
                  }
                },
              ),
              SizedBox(
                width: 200,
                child: TextField(controller: textController),
              ),
              ElevatedButton(
                onPressed: () {
                  streamController.add(textController.text);
                },
                child: Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
