import 'dart:developer' as developer;
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

enum NavigationBarInteractionMode {
  threeButton,
  twoButton,
  gesture,
  unknown,
}

extension NavigationBarInteractionModeExtension on NavigationBarInteractionMode {
  bool get isTwoOrThreeButton =>
      this == NavigationBarInteractionMode.threeButton /*|| this == NavigationBarInteractionMode.twoButton*/;
}

class NativeUtils {
  static const MethodChannel _channel = MethodChannel('com.datec.elgeniox/native_utils');

  static Future<NavigationBarInteractionMode> getNavigationBarInteractionMode() async {
    if (Platform.isIOS) return NavigationBarInteractionMode.unknown;
    try {
      final result = await _channel.invokeMethod('getNavigationBarInteractionMode');
      switch (result) {
        case 0:
          return NavigationBarInteractionMode.threeButton;
        case 1:
          return NavigationBarInteractionMode.twoButton;
        case 2:
          return NavigationBarInteractionMode.gesture;
        default:
          return NavigationBarInteractionMode.unknown;
      }
    } on PlatformException catch (e) {
      developer.log("Error al obtener el modo de interacción de la barra de navegación: '${e.message}'");
      return NavigationBarInteractionMode.unknown;
    }
  }

  static Future<bool> isAndroidVersion15orHigher() async {
    if (Platform.isIOS) return false;
    try {
      final version = DeviceInfoPlugin();
      final androidInfo = await version.androidInfo;
      final androidVersion = androidInfo.version.sdkInt;
      return androidVersion >= 35;
    } on Exception catch (e) {
      developer.log("Error al obtener la versión de Android: '$e'");
      return false;
    }
  }
}
