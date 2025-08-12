import 'package:app/app/app_bootstrapper.dart';
import 'package:app/app/my_app.dart';
import 'package:app/core/config/environment.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrapper.init(
    environment: ENV.staging,
    mainAppWidget: const MyApp(),
    runApp: runApp,
  );
}
