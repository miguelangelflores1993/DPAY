import 'dart:async';
import 'dart:io';

import 'package:app/core/config/environment.dart';
import 'package:app/core/config/init.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppBootstrapper {
  const AppBootstrapper._();

  static const Duration _loadingDuration = Duration(milliseconds: 3000);
  static const double _indicatorSize = 45;
  static const double _borderRadius = 10;
  static const Color _systemUIColor = Color(0xfff6f6f6);

  static Future<void> init({
    required Widget mainAppWidget,
    required ENV environment,
    required void Function(Widget) runApp,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.wait([
      initializeTranslations(),
      _setupLicenses(),
    ]);
    _configureEasyLoading();
    await _initializeHydratedStorage();
    await AppInit().initializeApp(environment: environment);
    _configureSystemUI();
    await _setupSentrySDK(runApp, mainAppWidget);
  }



  static Future<void> _setupLicenses() async {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }

  static void _configureEasyLoading() {
    EasyLoading.instance
      ..displayDuration = _loadingDuration
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = _indicatorSize
      ..radius = _borderRadius
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.black
      ..dismissOnTap = true;
  }

  static Future<void> _initializeHydratedStorage() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );
  }

  static void _configureSystemUI() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: _systemUIColor,
          statusBarColor: _systemUIColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  static Future<void> _setupSentrySDK(
    void Function(Widget) appRunner,
    Widget app,
  ) async {
    appRunner(
        app,
    );
  }
}
