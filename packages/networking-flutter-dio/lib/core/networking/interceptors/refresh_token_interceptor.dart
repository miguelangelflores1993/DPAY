import 'package:dio/dio.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';
import 'package:networking_flutter_dio/core/local/key_value_storage_base.dart';
import 'package:networking_flutter_dio/core/local/variables.dart';
import 'dart:developer' as developer;

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({required Dio dioClient, this.urlTokenRefreshServer})
    : _dio = dioClient;
  final String? urlTokenRefreshServer;

  final Dio _dio;

  String get tokenExpiredException => 'Invalid Authorization Token.';
  KeyValueStorageBase keyValueStorageBase = KeyValueStorageBase();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response != null && err.response?.statusCode == 401) {
      var responseData = err.response?.data;
      late String? code;

      // JSON? data;

      // Intenta parsear la respuesta como JSON si es una cadena
      if (responseData is String) {
        code = responseData as String?;
      } else {
        code = 'None';
      }

      // final headers = data?['errors'] as JSON?;

      if (code == tokenExpiredException) {
        final tokenDio = Dio()..options = _dio.options;
        final diop = Dio();
        final newToken = await _refreshTokenRequest(
          dioError: err,
          handler: handler,
          tokenDio: tokenDio,
          data: {},
        );

        if (newToken == null) {
          return super.onError(err, handler);
        }
        developer.log('--> RETRYING REQUEST WITH NEW TOKEN');
        developer.log('\tNew Token: $newToken');
        developer.log('\tRequest Path: ${err.requestOptions.uri.toString()}');
        try {
          final response = await diop.request<JSON>(
            err.requestOptions.uri.toString(),

            data: err.requestOptions.data,
            cancelToken: err.requestOptions.cancelToken,
            options: Options(
              headers: <String, Object?>{
                'Authorization': 'Bearer $newToken',
                'X-Refresh-Token':
                    err.requestOptions.headers['X-Refresh-Token'] ?? '',
                'language': err.requestOptions.headers['language'] ?? 'es',
              },
              method: err.requestOptions.method,
            ),
          );
          return handler.resolve(response);
        } on DioException catch (e) {
          return super.onError(e, handler);
        } catch (e) {
          developer.log('Error retrying request: $e');
          return super.onError(
            DioException(
              requestOptions: err.requestOptions,
              error: e,
              type: DioExceptionType.unknown,
            ),
            handler,
          );
        }
      }
    }

    return super.onError(err, handler);
  }

  Future<String?> _refreshTokenRequest({
    required DioException dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
    required JSON data,
  }) async {
    developer.log('--> REFRESHING TOKEN');
    try {
      developer.log('\tBody: $data');
      var refreshTokenLocal = await getToken();
      final diop = Dio();
      final response = await diop.post<JSON>(
        urlTokenRefreshServer ?? 'NO-URL-TOKEN',
        options: Options(
          headers: <String, Object?>{'X-Refresh-Token': refreshTokenLocal},
        ),
      );

      developer.log('\tStatus code:${response.statusCode}');
      developer.log('\tResponse: ${response.data}');

      developer.log('<-- END REFRESH');
      final responseData = response.data as JSON;
      final body = responseData['result'] as JSON;
      final token = body['accessToken'] as String;
      final refreshToken = body['refreshToken'] as String?;
      await setAuthToken(token);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        await setAuthRefreshToken(refreshToken);
      }
      return token;
    } on Exception catch (ex) {
      developer.log('\t--> ERROR');
      if (ex is DioException) {
        final de = ex;
        developer.log('\t\t--> Exception: ${de.error}');
        developer.log('\t\t--> Message: ${de.message}');
        developer.log('\t\t--> Response: ${de.response}');
      } else {
        developer.log('\t\t--> Exception: $ex');
      }
      developer.log('\t<-- END ERROR');
      developer.log('<-- END REFRESH');

      return null;
    }
  }

  Future<String?> getToken() async {
    try {
      var token =
          await keyValueStorageBase.secureStorage.read(
            key: GlobalVariables.authTokenRefreshKey,
          ) ??
          "NO_TOKEN";

      return token;
    } catch (e) {
      return null;
    }
  }

  Future<void> setAuthToken(String tokenNew) async {
    await keyValueStorageBase.secureStorage.write(
      key: GlobalVariables.authTokenKey,
      value: tokenNew,
    );
  }

  Future<void> setAuthRefreshToken(String tokenNew) async {
    await keyValueStorageBase.secureStorage.write(
      key: GlobalVariables.authTokenRefreshKey,
      value: tokenNew,
    );
  }
}
