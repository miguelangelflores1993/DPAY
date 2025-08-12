
import 'package:app/core/config/environment.dart';
import 'package:app/firebase_options_dev.dart' as dev;
import 'package:app/firebase_options_prod.dart' as prod;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// import 'package:validmeapp/bloc/notifications/notifications_bloc.dart';
// import 'package:validmeapp/core/app_router.dart';
// import 'package:validmeapp/core/fcm_manager/ln_manager.dart';
//   import 'package:validmeapp/firebase_options.dart' as prod;
//   import 'package:validmeapp/firebase_options_dev.dart' as dev;
// import 'package:validmeapp/models/notification_model.dart';

// Firebase Cloud Messaging Manager
@pragma('vm:entry-point')
class FBManager extends StatefulWidget {
  const FBManager(this.child, {super.key});

  final Widget child;

  @override
  State<FBManager> createState() => _FBManagerState();

  // This require main initialization

  static Future<void> initializeFCM() async {
    await requestPermission();
  }

  static Future<void> requestPermission() async {
    final messaging = FirebaseMessaging.instance;
    var settings = await messaging.getNotificationSettings();

    if (settings.authorizationStatus == AuthorizationStatus.notDetermined ||
        settings.authorizationStatus == AuthorizationStatus.denied) {
      await messaging.requestPermission();
    }
    settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // String? fcmToken = await messaging.getToken();
      // if (fcmToken == null) return;
      // print('FCM Token: $fcmToken');
    }

    // ! Implement PersistenceManager
    // final persistenceManager = await PersistenceManager.initialize();
    // await persistenceManager.saveData('fcmToken', fcmToken!, secure: true);

    // developer.log('FCM Token: $fcmToken');
  }

  // Initializations for messages
  @pragma('vm:entry-point')
  static Future<void> onBackgroundInit({required RemoteMessage message, required ENV environment}) async {
    await Firebase.initializeApp(
      name: environment == ENV.production ? 'egx-reloaded' : 'egx-app-dev',
      options: environment == ENV.production
          ? prod.DefaultFirebaseOptions.currentPlatform
          : dev.DefaultFirebaseOptions.currentPlatform,
    );
    
    // final notification = NotificationModel.fromRemoteMsg(message);

    // try {
    //   LNManager.showLocalNotification(notification);
    // } catch (e) {
    //   developer.log('Error onBackgroundInit: $e');
    // }
  }

  static void onForegroundMessage(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      // ! Local Notification
      // final notification = NotificationModel.fromRemoteMsg(message);
      // LNManager.showLocalNotification(notification);
      // if (!context.mounted) return;
      // context.read<NotificationsBloc>().add(NewNotification(notification));
    });
  }

  static Future<void> onInteractionMessage(BuildContext context) async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      if (!context.mounted) return;
      _handleInMessage(initialMessage, context);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (!context.mounted) return;
      _handleInMessage(message, context);
    });
  }

  static Future<void> _handleInMessage(RemoteMessage message, BuildContext context) async {
    // final notification = NotificationModel.fromRemoteMsg(message);
    // if (context.mounted) {
    //   context.read<NotificationsBloc>().add(NewNotification(notification));
    // }
    // ! Handle Navigations

    // if (message.data.isEmpty) return;

    // if (notification.data.containsKey('requestId')) {
    //   final requestId = notification.data['requestId'];

    //   final String redirect = '/request/$requestId';
    //   appRouter.go('/login_pin', extra: {'redirect': redirect});
    // }
  }
}

class _FBManagerState extends State<FBManager> {
  @override
  void initState() {
    super.initState();
    FBManager.onInteractionMessage(context);
    FBManager.onForegroundMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
