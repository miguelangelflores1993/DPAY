import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log('--> ERROR');
    final httpMethod = err.requestOptions.method.toUpperCase();
    final url = err.requestOptions.baseUrl + err.requestOptions.path;

    developer.log('\tMETHOD: $httpMethod \tURL: $url'); // GET
    if (err.response != null) {
      developer.log('\tStatus code: ${err.response!.statusCode}');

      developer.log('${err.response!.data}');
    } else if (err.error is SocketException) {
      const message = 'No internet connectivity';
      developer.log('\tException: FetchDataException');
      developer.log('\tMessage: $message');
    } else {
      developer.log('\tUnknown Error');
    }

    developer.log('<-- END ERROR');

    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;

    developer.log('--> $httpMethod $url'); //GET www.example.com/mock_path/all

    developer.log('\tHeaders:');
    options.headers.forEach((k, Object? v) => developer.log('\t\t$k: $v'));

    if (options.queryParameters.isNotEmpty) {
      developer.log('\tqueryParams:');
      options.queryParameters.forEach((k, Object? v) => developer.log('\t\t$k: $v'));
    }

    if (options.data != null && options.contentType != "multipart/form-data") {
      developer.log('\tBody: ${jsonEncode(options.data)}');
    }

    developer.log('--> END $httpMethod');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    developer.log('<-- RESPONSE');

    developer.log('\tStatus code: ${response.statusCode}');

    if (response.statusCode == 304) {
      developer.log('\tSource: Cache');
    } else {
      developer.log('\tSource: Network');
    }

    developer.log('\tResponse: ${jsonEncode(response.data)}');

    developer.log('<-- END HTTP');

    super.onResponse(response, handler);
  }
}
