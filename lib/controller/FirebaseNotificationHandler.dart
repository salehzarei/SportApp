import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'NotificationHandler.dart';

class FirebaseNotifications {
  FirebaseMessaging _messaging;
  BuildContext mycontext;

  void setupFirebase(BuildContext context) {
    _messaging = FirebaseMessaging();
    NotificationHandlerr.initNotification(context);
    firebaseCloudMessagingListener(context);
    mycontext = context;
  }

  void firebaseCloudMessagingListener(BuildContext context) {
    _messaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    _messaging.getToken().then((value) => print('Firebase Token is: $value'));

    _messaging
        .subscribeToTopic('sportplus')
        .whenComplete(() => print('SEND TOO FLUTTER SPORT'));

    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      _messaging.configure(
          onBackgroundMessage: fcmBackgroundMessageHandler,
          onMessage: (Map<String, dynamic> message) async {
            showNotification(message['data']['title'], message['data']['body']);
          },
          onLaunch: (Map<String, dynamic> message) async {},
          onResume: (Map<String, dynamic> message) async {});
    });
  }

  static Future fcmBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    showNotification(
        message['notification']['title'], message['notification']['body']);
    return Future<void>.value();
  }

  static void showNotification(title, body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'pdf.co.ir.sportapplication', 'channel', 'My channel description',
        autoCancel: false,
        // ongoing: true,
        fullScreenIntent: true,
        importance: Importance.max,
        priority: Priority.high);
    var platformchannelSpefics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationHandlerr.flutterLocalNotificationsPlugin
        .show(0, title, body, platformchannelSpefics, payload: 'link');
  }
}
