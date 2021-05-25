import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandlerr {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static BuildContext mycontext;
  static void initNotification(BuildContext context) {
    mycontext = context;
    var initAndroid = AndroidInitializationSettings("@drawable/icon");
    // var initIos=IOSInitializationSettings()
    var initSetting = InitializationSettings(android: initAndroid);
    flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
  }

  static Future onSelectNotification(String payload) async {
    if (payload != null) {
      // launch(payload);
      // Get.to(ProfileUser());
    }
  }
}
