import 'package:app/app/app_bootstrapper.dart';
import 'package:app/app/my_app.dart';
import 'package:app/core/config/environment.dart';
import 'package:app/core/config/firebase_notification.dart';
// import 'package:app/core/config/local_notification.dart';
// import 'package:app/shared/constants/notification_model.dart';
import 'package:app/firebase_options_dev.dart' as dev;
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Inicializaciones para mensajes en segundo plano.
@pragma('vm:entry-point')
Future<void> onBackgroundInitDev(RemoteMessage message) async {
  await Firebase.initializeApp(
    name: 'egx-app-dev',
    options: dev.DefaultFirebaseOptions.currentPlatform,
  );
  // Only for notification type data
  // final notification = NotificationModel.fromRemoteMsg(message);
  // await LocalNotification.instance.showLocalNotification(notification);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(onBackgroundInitDev);

  await AppBootstrapper.init(
    environment: ENV.development,
    mainAppWidget: DevicePreview(
      enabled: false,
      builder: (context) {
        FirebaseNotification.initializeFCM(context);
        return const MyApp();
      },
    ),
    runApp: runApp,
  );
}
