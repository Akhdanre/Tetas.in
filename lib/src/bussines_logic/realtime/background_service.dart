import 'dart:convert';
import 'dart:developer';

import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tetas_in/config/base_url.dart';
// import 'package:tetas_in/src/utils/shared_preferences/user_data.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initSse() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  SSEClient.subscribeToSSE(
    method: SSERequestType.GET,
    url:
        "http://${BaseUrl.host}:8000/sse/oukenze/90d35625-fd55-4f0b-a1ba-101c486527ae",
    header: {
      "Accept": "text/event-stream",
      "Cache-Control": "no-cache",
    },
  ).listen(
    (event) {
      try {
        var json = jsonDecode(event.data!);
        if(json["data"] != null){
            showNotification("Pemberitahuan", json["data"]["message"]);
        }
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    },
  );
}

Future<void> showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '2',
    'notif_hatch',
    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
  );
}
