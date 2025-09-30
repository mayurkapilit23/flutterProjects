import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProiderScreen extends StatefulWidget {
  const PathProiderScreen({super.key});

  @override
  State<PathProiderScreen> createState() => _PathProiderScreenState();
}

class _PathProiderScreenState extends State<PathProiderScreen> {
  String? docPath = '';
  String? tempPath = '';

  Future<void> getPath() async {
    final doc = await getApplicationDocumentsDirectory();
    final temp = await getTemporaryDirectory();

    setState(() {
      docPath = doc.path;
      tempPath = temp.path;
    });
  }

  @override
  void initState() {
    getPath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Doc Path : $docPath'),
              Text('Temp Path : $tempPath'),
            ],
          ),
        ),
      ),
    );
  }
}
