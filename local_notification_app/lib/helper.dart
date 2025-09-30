import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class Helper {
  static String currentDate() {
    final now = DateTime.now();
    final formatedDate = DateFormat.yMMMMd().format(now);
    return formatedDate;
  }

  static String currentTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('jm').format(now);
    return formattedTime;
  }


  static void requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }
}
