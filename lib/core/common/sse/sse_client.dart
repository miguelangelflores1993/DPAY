import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

// Modelo para los eventos SSE
class SSEModel {
  SSEModel({required this.data, required this.id, required this.event});
  String data;
  String id;
  String event;

  @override
  String toString() {
    return 'SSEModel(data: $data, id: $id, event: $event)';
  }
}

// Enum para tipos de request
enum SSERequestType { GET, POST }

/// Cliente SSE simple para uso directo
class SSEClient {
  http.Client? _client;
  StreamController<SSEModel>? _streamController;
  StreamSubscription<String>? _subscription;
  Timer? _retryTimer;
  bool _isSubscribed = false;

  /// Reintentar conexión después de un delay
  void _retryConnection({
    required SSERequestType method,
    required String url,
    required Map<String, String> header,
    Map<String, dynamic>? body,
  }) {
    if (!_isSubscribed) return;

    developer.log('---RETRY CONNECTION---');
    _retryTimer = Timer(const Duration(seconds: 5), () {
      if (_isSubscribed) {
        _subscribeInternal(
          method: method,
          url: url,
          header: header,
          body: body,
        );
      }
    });
  }

  /// Método interno para manejar la suscripción SSE
  void _subscribeInternal({
    required SSERequestType method,
    required String url,
    required Map<String, String> header,
    Map<String, dynamic>? body,
  }) {
    if (!_isSubscribed) return;

    try {
      _client?.close();
      _client = http.Client();

      final lineRegex = RegExp(r'^([^:]*)(?::)?(?: )?(.*)?$');
      var currentSSEModel = SSEModel(data: '', id: '', event: '');

      final request = http.Request(
        method == SSERequestType.GET ? 'GET' : 'POST',
        Uri.parse(url),
      );

      // Agregar headers
      header.forEach((key, value) {
        request.headers[key] = value;
      });

      // Agregar body si existe
      if (body != null) {
        request.body = jsonEncode(body);
      }

      final response = _client!.send(request);

      response.asStream().listen(
        (data) {
          if (!_isSubscribed) return;

          _subscription?.cancel();

          _subscription = data.stream
              .transform(const Utf8Decoder())
              .transform(const LineSplitter())
              .listen(
                (dataLine) {
                  if (!_isSubscribed) return;

                  if (dataLine.isEmpty) {
                    // Evento completo leído, agregarlo al stream
                    if (_isSubscribed && _streamController != null && !_streamController!.isClosed) {
                      _streamController!.add(currentSSEModel);
                    }
                    currentSSEModel = SSEModel(data: '', id: '', event: '');
                    return;
                  }

                  final Match? match = lineRegex.firstMatch(dataLine);
                  if (match == null) return;

                  final field = match.group(1);
                  if (field == null || field.isEmpty) return;

                  var value = '';
                  if (field == 'data') {
                    value = dataLine.substring(5);
                  } else {
                    value = match.group(2) ?? '';
                  }

                  switch (field) {
                    case 'event':
                      currentSSEModel.event = value;
                    case 'data':
                      currentSSEModel.data = '${currentSSEModel.data}$value\n';
                    case 'id':
                      currentSSEModel.id = value;
                    case 'retry':
                      break;
                    default:
                      developer.log('---ERROR PARSING---');
                      developer.log(dataLine);
                      if (_isSubscribed) {
                        _retryConnection(
                          method: method,
                          url: url,
                          header: header,
                          body: body,
                        );
                      }
                  }
                },
                onError: (Object e, StackTrace s) {
                  developer.log('---STREAM ERROR---');
                  developer.log(e.toString());
                  if (_isSubscribed) {
                    _retryConnection(
                      method: method,
                      url: url,
                      header: header,
                      body: body,
                    );
                  }
                },
                onDone: () {
                  developer.log('---STREAM DONE---');
                  if (_isSubscribed) {
                    _retryConnection(
                      method: method,
                      url: url,
                      header: header,
                      body: body,
                    );
                  }
                },
              );
        },
        onError: (Object e, StackTrace s) {
          developer.log('---REQUEST ERROR---');
          developer.log(e.toString());
          if (_isSubscribed) {
            _retryConnection(
              method: method,
              url: url,
              header: header,
              body: body,
            );
          }
        },
      );
    } on Exception catch (e) {
      developer.log('---CONNECTION ERROR---');
      developer.log(e.toString());
      if (_isSubscribed) {
        _retryConnection(
          method: method,
          url: url,
          header: header,
          body: body,
        );
      }
    }
  }

  /// Suscribirse a Server-Sent Events
  Stream<SSEModel> subscribeToSSE({
    required SSERequestType method,
    required String url,
    required Map<String, String> header,
    Map<String, dynamic>? body,
  }) {
    // Limpiar conexión existente
    unsubscribe();

    _isSubscribed = true;
    _streamController = StreamController<SSEModel>();

    developer.log('--SUBSCRIBING TO SSE---');

    _subscribeInternal(
      method: method,
      url: url,
      header: header,
      body: body,
    );

    return _streamController!.stream;
  }

  /// Desuscribirse del SSE
  void unsubscribe() {
    developer.log('--UNSUBSCRIBING FROM SSE---');

    _isSubscribed = false;

    _retryTimer?.cancel();
    _retryTimer = null;

    _subscription?.cancel();
    _subscription = null;

    _client?.close();
    _client = null;

    if (_streamController != null && !_streamController!.isClosed) {
      _streamController!.close();
    }
    _streamController = null;
  }

  /// Verificar si está suscrito
  bool get isSubscribed => _isSubscribed;

  /// Dispose para limpiar recursos
  void dispose() {
    unsubscribe();
  }
}
