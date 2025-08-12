import 'dart:developer' as developer;

import 'package:flutter/services.dart';

class NotificationSettings {
  static const platform = MethodChannel(
    'muv.mobi.lat.app/notification_settings',
  );

  static Future<void> openNotificationSettings() async {
    try {
      await platform.invokeMethod('openNotificationSettings');
    } on PlatformException catch (e) {
      developer.log('Error al abrir configuración de notificaciones: $e');
    }
  }
}
