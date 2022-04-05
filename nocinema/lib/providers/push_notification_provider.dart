import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;

class PushNotificationProvider {
// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void initNotifications() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void onMessageListener() {
//segunfo palno
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('nova notification $message');
      }
    });

//Receber a s notificacoes empriemiro plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
  }

  Future<void> sendMessage(
      String to, Map<String, dynamic> data, String title, String body) async {
    try {
      Uri uri = Uri.https('fcm.googleapis.com', '/fcm/send');

      final result = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAADJhYDLo:APA91bFEQJsORxQcfpVd_bgRWYpQBAkk4qYqmCvl56Vb_1Xq1GTqGAG6QG3plP4f7NFcXRG4BZbhDW0Jr3jPfbtE3m8qpRGdq0xT3js1pPsE2rJ5TKrG_Vt2bbekEu0xewnUzW5vCa13'
        },
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'ttl': '4500s',
          'data': data,
          'to': to
        }),
      );
      print(result.statusCode);
    } catch (e) {
      print("erro ao enviar $e");
    }
  }
}
