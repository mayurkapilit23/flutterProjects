import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification_app/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void customLocalNotification() {
    flutterLocalNotificationsPlugin.show(
      0,
      'Linkedin',
      'New jobs for "application developer"',
      NotificationDetails(
        android: AndroidNotificationDetails(
          "channelId",
          "localNotification",
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            customLocalNotification();
          },
          child: Text('local Notification'),
        ),
      ),
    );
  }
}
