import 'dart:async';

import 'package:dio/dio.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';
import 'package:networking_flutter_dio/core/networking/api_interface.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';
import 'package:networking_flutter_dio/core/networking/dio_service.dart';
import 'package:networking_flutter_dio/core/networking/response_model.dart';

class PaginatedResponse<T> {
  final List<T> items;
  final Map<String, dynamic> meta;

  PaginatedResponse({required this.items, required this.meta});
}

class ApiService implements ApiInterface {
  ApiService(DioService dioService) : _dioService = dioService;

  late final DioService _dioService;

  @override
  Future<T> deleteData<T>({
    required String endpoint,
    required T Function(ResponseModel<JSON> response) converter,
    Object? data,
    bool requiresAuthToken = true,
  }) async {
    try {
      final response = await _dioService.delete<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
      );
      return converter(response);
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on FormatException catch (ex) {
      throw CustomException.fromParsingException(ex);
    } catch (ex) {
      throw CustomException.fromDioException(Exception(ex));
    }
  }

  @override
  Future<PaginatedResponse<T>> getCollectionData<T>({
    required String endpoint,
    required T Function(JSON responseBody) converter,
    required String collectionKey,
    JSON? queryParams,
    String? language = 'es',
    bool requiresAuthToken = true,
  }) async {
    try {
      final data = await _dioService.getCollection(
        endpoint: endpoint,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
            'language': language,
          },
        ),
        queryParams: queryParams,
      );

      final body = data.body;

      if (body is Map<String, dynamic>) {
        final rawItems = getNestedListByPath(body, collectionKey);
        if (rawItems == null) {
          throw FormatException(
            'Key path "$collectionKey" not found or not a List.',
          );
        }

        final items = rawItems.map<T>((e) => converter(e as JSON)).toList();

        // Extraer metadata del primer nivel (podrías adaptarlo si quieres la metadata anidada también)
        final Map<String, dynamic> meta = Map.of(body);

        return PaginatedResponse<T>(items: items, meta: meta);
      } else if (body is List) {
        final items =
            body.map<T>((dataMap) => converter(dataMap as JSON)).toList();
        return PaginatedResponse<T>(items: items, meta: {});
      } else {
        throw FormatException(
          'Expected Map or List as body but got ${body.runtimeType}',
        );
      }
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on FormatException catch (ex) {
      throw CustomException.fromParsingException(ex);
    } catch (ex) {
      throw CustomException.fromDioException(Exception(ex));
    }
  }

  List<dynamic>? getNestedListByPath(Map<String, dynamic> map, String path) {
    final parts = path.split('.');
    dynamic current = map;
    for (final part in parts) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current is List ? current : null;
  }

  @override
  Future<T> getDocumentData<T>({
    required String endpoint,
    required T Function(JSON response) converter,
    JSON? queryParams,
    String? language = 'es',
    bool requiresAuthToken = true,
  }) async {
    try {
      final data = await _dioService.get<JSON>(
        endpoint: endpoint,
        queryParams: queryParams,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
            'language': language,
          },
        ),
      );

      return converter(data.body);
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on FormatException catch (ex) {
      throw CustomException.fromParsingException(ex);
    } catch (ex) {
      throw CustomException.fromDioException(Exception(ex));
    }
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    required Object data,
    required T Function(ResponseModel<JSON> response) converter,
    JSON? headers,
    bool requiresAuthToken = true,
    void Function(int count, int total)? onSendProgress,
  }) async {
    try {
      final response = await _dioService.post<JSON>(
        endpoint: endpoint,
        data: data,
        onSendProgress: onSendProgress,
        options: Options(
          headers: headers,
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
      );

      return converter(response);
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on FormatException catch (ex) {
      throw CustomException.fromParsingException(ex);
    } catch (ex) {
      throw CustomException.fromDioException(Exception(ex));
    }
  }

  @override
  Future<T> updateData<T>({
    required String endpoint,
    required Object data,
    JSON? queryParams,
    required T Function(ResponseModel<JSON> response) converter,
    bool requiresAuthToken = true,
  }) async {
    try {
      final response = await _dioService.path<JSON>(
        endpoint: endpoint,
        data: data,
        queryParams: queryParams,
        options: Options(
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
      );

      return converter(response);
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on FormatException catch (ex) {
      throw CustomException.fromParsingException(ex);
    } catch (ex) {
      throw CustomException.fromDioException(Exception(ex));
    }
  }

  @override
  Future<T> replaceData<T>({
    required String endpoint,
    required Object data,
    JSON? queryParams,
    required T Function(ResponseModel<JSON> response) converter,
    bool requiresAuthToken = true,
  }) async {
    try {
      final response = await _dioService.put<JSON>(
        endpoint: endpoint,
        data: data,
        queryParams: queryParams,
        options: Options(
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
      );

      return converter(response);
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on FormatException catch (ex) {
      throw CustomException.fromParsingException(ex);
    } catch (ex) {
      throw CustomException.fromDioException(Exception(ex));
    }
  }
}
