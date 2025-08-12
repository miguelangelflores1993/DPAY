import 'package:app/core/config/environment.dart';
import 'package:app/core/config/logarte.dart';
import 'package:app/modules/auth/auth_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:networking_flutter_dio/core/networking/api_config.dart';
import 'package:networking_flutter_dio/core/networking/api_service.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  ApiRestFactory.setIdentityBaseUrl(apiUrlIdentity, logarte: logarte);

  sl.registerLazySingleton<ApiService>(
    () => ApiRestFactory.createService(apiUrl: apiUrlCatalog),
    instanceName: 'catalogService',
  );
  initAuthInjection(sl);
}
