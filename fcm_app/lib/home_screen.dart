import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
  }

  void initFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    token = await messaging.getToken();
    print("🟢 FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📨 Foreground: ${message.notification?.title}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message.notification?.body ?? '')));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 App opened via notification");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: SelectableText('Your FCM Token:\n\n$token')),
      ),
    );
  }
}
