import 'dart:developer' as developer;

import 'package:app/shared/constants/notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseNotification {
  FirebaseNotification._();
  static final FirebaseNotification _instance = FirebaseNotification._();
  static FirebaseNotification get instance => _instance;

  static bool _isInitialized = false;

  static Future<void> initializeFCM(BuildContext context) async {
    if (_isInitialized) return;
    await _requestPermission();
   
    if (!context.mounted) return;
    await FirebaseNotification.onInteractionMessage(context);
    FirebaseNotification.onForegroundMessage();
    _isInitialized = true;
  }

  static Future<void> _requestPermission() async {
    final messaging = FirebaseMessaging.instance;
    var settings = await messaging.getNotificationSettings();

    if (settings.authorizationStatus == AuthorizationStatus.notDetermined ||
        settings.authorizationStatus == AuthorizationStatus.denied) {
      await messaging.requestPermission();
    }
    settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // final fcmToken = await messaging.getToken();
      // if (fcmToken != null) {
      //   developer.log('FCM Token: $fcmToken');
      //   // ¡Implementa PersistenceManager aquí si es necesario!
      // }
    }
  }

  static void onForegroundMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      final notification = NotificationModel.fromRemoteMsg(message);
     
      developer.log('Mensaje en primer plano: ${message.data}');
    });
  }

  static Future<void> onInteractionMessage(BuildContext context) async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      if (!context.mounted) return;
      await _handleInMessage(initialMessage, context);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      if (!context.mounted) return;
      await _handleInMessage(message, context);
    });
  }

  static Future<void> _handleInMessage(RemoteMessage message, BuildContext context) async {
    // final notification = NotificationModel.fromRemoteMsg(message);
    // if (context.mounted) {
    //   context.read<NotificationsBloc>().add(NewNotification(notification));
    // }

    if (message.data.isEmpty) return;
    // if (notification.data.containsKey('requestId')) {
    //   final requestId = notification.data['requestId'];

    //   final String redirect = '/request/$requestId';
    //   appRouter.go('/login_pin', extra: {'redirect': redirect});
    // }

    // if (notification.data.containsKey('sessionId')) {
    //   final sessionId = notification.data['sessionId'];
    //   final String redirect = '/session/$sessionId';
    //   appRouter.go(
    //     '/login_pin',
    //     extra: {'redirect': redirect},
    //   );
    //   return;
    // }
  }
}
