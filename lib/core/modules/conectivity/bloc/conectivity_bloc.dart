import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ConnectivityState { connected, disconnected, reconnecting }

abstract class ConnectivityEvent {}

class ConnectivityChangedEvent extends ConnectivityEvent {
  ConnectivityChangedEvent(this.connectivityResult);
  final List<ConnectivityResult> connectivityResult;
}

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityState.disconnected) {
    on<ConnectivityChangedEvent>(_onConnectivityChanged);
    _checkInitialConnectivity();

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChangedEvent(result));
    });
  }
  late final StreamSubscription<List<ConnectivityResult>> _subscription;
  final Dio _dio = Dio();
  final Connectivity _connectivity = Connectivity();
  bool _isFirstVisit = true;
  ConnectivityState _lastState = ConnectivityState.disconnected;

  Future<void> _onConnectivityChanged(
    ConnectivityChangedEvent event,
    Emitter<ConnectivityState> emit,
  ) async {
    final isOffline = event.connectivityResult.contains(
      ConnectivityResult.none,
    );

    if (isOffline) {
      if (_lastState != ConnectivityState.disconnected) {
        _lastState = ConnectivityState.disconnected;
        emit(ConnectivityState.disconnected);
      }
      return;
    }

    final hasInternet = await _hasInternetConnection();
    if (!hasInternet) {
      if (_lastState != ConnectivityState.disconnected) {
        _lastState = ConnectivityState.disconnected;
        emit(ConnectivityState.disconnected);
      }
      return;
    }

    if (_isFirstVisit) {
      _isFirstVisit = false;
      _lastState = ConnectivityState.connected;
      emit(ConnectivityState.connected);
    } else if (_lastState == ConnectivityState.disconnected) {
      _lastState = ConnectivityState.reconnecting;
      emit(ConnectivityState.reconnecting);

      _lastState = ConnectivityState.connected;
      emit(ConnectivityState.connected);
    } else if (_lastState != ConnectivityState.connected) {
      _lastState = ConnectivityState.connected;
      emit(ConnectivityState.connected);
    }
  }

  Future<void> _checkInitialConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    add(ConnectivityChangedEvent(result));
  }

  Future<bool> _hasInternetConnection() async {
    try {
      final response = await _dio.get<dynamic>(
        'https://www.google.com',
        options: Options(receiveTimeout: const Duration(seconds: 2)),
      );

      return response.statusCode == 200;
    } on DioException catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
