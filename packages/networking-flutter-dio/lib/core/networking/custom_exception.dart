import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';
import 'package:networking_flutter_dio/core/networking/errors_messages.dart';

class CustomException implements Exception {
  CustomException({
    required this.message,
    this.code,
    int? statusCode,
    this.exceptionType = ExceptionType.apiException,
  }) : statusCode = statusCode ?? 500,
       name = exceptionType.name;

  factory CustomException.fromDioException(Exception error) {
    try {
      if (error is DioException) {
        final responseData = error.response?.data as JSON?;
        final errors = responseData?['errors'];
        String errorMessage = '';

        if (error.response?.statusCode == 409) {
          errorMessage = _extractErrorMessage(errors);
          return CustomException(
            exceptionType: ExceptionType.apiException,
            statusCode: error.response?.statusCode,
            code: responseData?['message'],
            message: errorMessage,
          );
        }

        if (error.response?.statusCode == 400) {
          errorMessage = _extractErrorMessage(errors);
          return CustomException(
            exceptionType: ExceptionType.badResponse,
            statusCode: error.response?.statusCode,
            code: responseData?['message'],
            message: errorMessage,
          );
        }

        if (errors != null) {
          errorMessage = _extractErrorMessage(errors);
        }
        final mesasage = translateError(errorMessage);
        if (mesasage.isNotEmpty) {
          return CustomException(
            exceptionType: ExceptionType.badResponse,
            statusCode: error.response?.statusCode,
            message: translateError(errorMessage),
          );
        }

        // Si no hay errores específicos, manejamos por tipo de DioException
        switch (error.type) {
          case DioExceptionType.cancel:
            return CustomException(
              exceptionType: ExceptionType.cancelException,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkCancelled,
            );
          case DioExceptionType.connectionTimeout:
            return CustomException(
              exceptionType: ExceptionType.connectTimeoutException,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkConnectionTimeout,
            );
          case DioExceptionType.sendTimeout:
            return CustomException(
              exceptionType: ExceptionType.sendTimeoutException,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkSendTimeout,
            );
          case DioExceptionType.receiveTimeout:
            return CustomException(
              exceptionType: ExceptionType.receiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkReceiveTimeout,
            );
          case DioExceptionType.badResponse:
            return CustomException(
              exceptionType: ExceptionType.badResponse,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkBadResponse,
            );
          case DioExceptionType.unknown:
            return CustomException(
              exceptionType: ExceptionType.unrecognizedException,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkUnknown,
            );
          case DioExceptionType.badCertificate:
            return CustomException(
              exceptionType: ExceptionType.unrecognizedException,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkBadCertificate,
            );
          case DioExceptionType.connectionError:
            return CustomException(
              exceptionType: ExceptionType.connectionError,
              statusCode: error.response?.statusCode,
              message: AppStrings.errorNetworkConnectionError,
            );
        }
      }
      if (error is FormatException) {
        return CustomException(
          exceptionType: ExceptionType.formatException,
          message: AppStrings.errorNetworkFormatException,
        );
      } else {
        return CustomException(
          exceptionType: ExceptionType.unrecognizedException,
          message: AppStrings.errorNetworkUnknown,
        );
      }
    } on FormatException catch (e) {
      return CustomException(
        exceptionType: ExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return CustomException(
        exceptionType: ExceptionType.unrecognizedException,
        message: AppStrings.unknownError,
      );
    } catch (e) {
      return CustomException(
        exceptionType: ExceptionType.unrecognizedException,
        message: AppStrings.unrecognizedError,
      );
    }
  }

  /// Extrae el mensaje de error de diferentes formatos de respuesta
  static String _extractErrorMessage(dynamic errors) {
    if (errors is String) {
      return errors;
    } else if (errors is List) {
      List<String> messages = [];

      for (var error in errors) {
        if (error is String) {
          messages.add(error);
        } else if (error is Map) {
          String message = '';
          if (error['details'] != null &&
              error['details'].toString().isNotEmpty) {
            message = error['details'].toString();
          } else if (error['message'] != null &&
              error['message'].toString().isNotEmpty) {
            message = error['message'].toString();
          } else if (error['code'] != null) {
            message = error['code'].toString();
          }
          if (message.isNotEmpty) {
            messages.add(message);
          }
        }
      }

      return messages.join(', ');
    } else if (errors is Map) {
      // Ignorar la clave "$"
      final filtered = Map.of(errors)..remove('\$');
      if (filtered.isNotEmpty) {
        // Si quedan otros errores, únelos
        return filtered.values.expand((v) => v is List ? v : [v]).join(', ');
      }
      // Si solo estaba la clave "$", ignora el mensaje
      return '';
    }

    return '';
  }

  factory CustomException.fromParsingException(FormatException error) {
    if (dotenv.env['DEBUG'] == 'true') {
      return CustomException(
        exceptionType: ExceptionType.serializationException,
        message: error.message,
      );
    }
    return CustomException(
      exceptionType: ExceptionType.serializationException,
      message: AppStrings.serializationError,
    );
  }

  final String name;
  final String message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;
}

enum ExceptionType {
  tokenExpiredException,
  connectionError,
  cancelException,
  badResponse,
  connectTimeoutException,
  sendTimeoutException,
  receiveTimeoutException,
  socketException,
  fetchDataException,
  formatException,
  unrecognizedException,
  apiException,
  serializationException,
}

String translateError(String message) {
  return errorTranslations[message.trim()] ?? '';
}
