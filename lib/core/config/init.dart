import 'dart:async';
import 'dart:developer';

import 'package:app/app/injection.dart';
import 'package:app/core/config/bloc_observer.dart';
import 'package:app/core/config/environment.dart';
import 'package:app/core/local/key_value_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_flutter_dio/core/local/key_value_storage_base.dart';

class AppInit {
  KeyValueStorageService keyValueStorageService = KeyValueStorageService();
  Future<void> initializeApp({required ENV environment}) async {
    Bloc.observer = const AppBlocObserver();
    await initEnvironment(environment);
    await KeyValueStorageBase.init();
    await init();
    final value = await keyValueStorageService.getOrCreateSession();
    final auth = await keyValueStorageService.getAuth();
    log('session: $value');
    log('auth: ${auth?.customerId}');
  }
}
