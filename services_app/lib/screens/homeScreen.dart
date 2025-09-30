import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? text;
  String imageUrl =
      'https://images.unsplash.com/photo-1751256743518-5836ec5154e9?q=80&w=464&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, imageUrl) => CircularProgressIndicator(),
              errorWidget: (context, imageUrl, error) => Icon(Icons.error),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Foreground Service')),
            ElevatedButton(onPressed: () {}, child: Text('Background Service')),
            ElevatedButton(onPressed: () {}, child: Text('$text')),
          ],
        ),
      ),
    );
  }
}
