import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logarte/logarte.dart';
import 'package:networking_flutter_dio/core/networking/api_service.dart';
import 'package:networking_flutter_dio/core/networking/dio_service.dart';
import 'package:networking_flutter_dio/core/networking/interceptors/api_interceptor.dart';
import 'package:networking_flutter_dio/core/networking/interceptors/logging_interceptor.dart';
import 'package:networking_flutter_dio/core/networking/interceptors/refresh_token_interceptor.dart';

class ApiRestFactory {
  // Renombrado para claridad, ya no es un Singleton 'ApiRest'

  // La URL del servicio de identidad es necesaria para el refresh token
  static String? _identityBaseUrl;
  static Logarte? _logarte;

  // Método para configurar la URL base del servicio de identidad
  static void setIdentityBaseUrl(String url, {Logarte? logarte}) {
    _identityBaseUrl = url;
    _logarte = logarte;
  }

  // Método estático para crear una instancia de ApiService configurada
  static ApiService createService({
    required String apiUrl, // La URL base específica para este servicio
    String language = 'es-ES',
    Map<String, dynamic>? headers,
    bool requiresRefreshToken =
        false, // Indicar si este servicio necesita el interceptor
    // Ya no necesitas authUserKey aquí si se maneja en interceptores o almacenamiento seguro
  }) {
    if (requiresRefreshToken && _identityBaseUrl == null) {
      throw Exception(
        "Identity Base URL must be set using setIdentityBaseUrl() before creating a service that requires refresh token.",
      );
    }

    final baseOptions = BaseOptions(
      persistentConnection: true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept-Language': language,
        if (headers != null) ...headers,
        // Puedes añadir aquí headers comunes si los hay
      },
      baseUrl: apiUrl, // Usa la URL específica del microservicio
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
    final dio = Dio(baseOptions);

    // Construye la URL de refresh usando la URL de identidad guardada
    final String? refreshTokenUrl =
        _identityBaseUrl != null
            ? '$_identityBaseUrl/api/Auth/RefreshTokens' // Ajusta esta ruta si es diferente
            : null;

    final interceptors = <Interceptor>[
      ApiInterceptor(), // Asume que este es genérico o configúralo según necesidad
      if (requiresRefreshToken && refreshTokenUrl != null)
        RefreshTokenInterceptor(
          dioClient: dio, // Pasa el Dio específico de este servicio
          urlTokenRefreshServer:
              refreshTokenUrl, // Usa la URL de identidad para refrescar
        ),
      if (kDebugMode) LoggingInterceptor(),
      if (_logarte != null) LogarteDioInterceptor(_logarte!),
    ];
    dio.interceptors.addAll(interceptors);

    final dioService = DioService(dioClient: dio);

    // Retorna la instancia de ApiService configurada
    return ApiService(dioService);
  }
}
