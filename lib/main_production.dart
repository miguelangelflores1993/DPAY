import 'package:app/app/app_bootstrapper.dart';
import 'package:app/app/my_app.dart';
import 'package:app/core/config/environment.dart';
import 'package:app/core/config/firebase_notification.dart';
// import 'package:app/core/config/firebase_notification.dart';
// import 'package:app/core/config/local_notification.dart';
import 'package:app/firebase_options_prod.dart' as prod;
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
Future<void> onBackgroundInitDev(RemoteMessage message) async {
  await Firebase.initializeApp(
    name: 'egx-reloaded',
    options: prod.DefaultFirebaseOptions.currentPlatform,
  );
  // Only for notification type data
  // final notification = NotificationModel.fromRemoteMsg(message);
  // await LocalNotification.instance.showLocalNotification(notification);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(onBackgroundInitDev);
  await AppBootstrapper.init(
    environment: ENV.production,
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
