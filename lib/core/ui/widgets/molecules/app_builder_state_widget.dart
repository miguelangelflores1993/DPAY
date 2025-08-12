import 'package:app/core/modules/generic/presentation/bloc/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBuilder<T extends BaseState> extends StatelessWidget {
  const AppBuilder({
    required this.state,
    required this.onSuccess,
    super.key,
    this.onLoading,
    this.onError,
    this.onEmpty,
    this.shouldShowError,
  });

  final T state;
  final Widget Function(T successState) onSuccess;
  final Widget Function()? onLoading;
  final Widget Function(Object error, T errorState)? onError;
  final Widget Function()? onEmpty;
  final bool Function(T errorState)? shouldShowError;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return onLoading?.call() ?? _defaultLoading();
    }

    if (state.isError) {
      final showError = shouldShowError?.call(state) ?? true;
      if (showError) {
        return onError?.call(state.error ?? 'Error', state) ?? _defaultError(state.error);
      } else {
        return const SizedBox();
      }
    }

    if (state.isSuccess) {
      return onSuccess(state);
    }

    return onEmpty?.call() ?? const SizedBox();
  }

  Widget _defaultLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _defaultError(Object? error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(height: 8),
          Text(
            error?.toString() ?? 'Error desconocido',
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class BlocStateView<TBloc extends BlocBase<TState>, TState extends BaseState> extends StatelessWidget {
  const BlocStateView({
    required this.onSuccess,
    super.key,
    this.onLoading,
    this.onError,
    this.onEmpty,
    this.shouldShowError,
  });

  final Widget Function(TState successState) onSuccess;
  final Widget Function()? onLoading;
  final Widget Function(Object error, TState errorState)? onError;
  final Widget Function()? onEmpty;
  final bool Function(TState errorState)? shouldShowError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TBloc, TState>(
      builder: (context, state) {
        return AppBuilder<TState>(
          state: state,
          onSuccess: onSuccess,
          onLoading: onLoading,
          onError: onError,
          onEmpty: onEmpty,
          shouldShowError: shouldShowError,
        );
      },
    );
  }
}
