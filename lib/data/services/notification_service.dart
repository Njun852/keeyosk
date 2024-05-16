import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/main.dart';

class NotificationService {
  static final NotificationService _service =
      NotificationService._sharedInstance();

  factory NotificationService() => _service;

  NotificationService._sharedInstance();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {}
    navigatorKey.currentState!.pushNamed(manageOrders);
  }

  Future<void> showNotification(String tblNumber) async {
    AndroidNotificationDetails notification = AndroidNotificationDetails(
        fullScreenIntent: true,
        tblNumber,
        'testing',
        priority: Priority.max,
        visibility: NotificationVisibility.public);
    await _flutterLocalNotificationsPlugin.show(
      1,
      'Recieved New Order!',
      'A new order from table #$tblNumber has been made.',
      NotificationDetails(android: notification),
    );
  }
}
