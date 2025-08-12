import 'package:app/shared/constants/native_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NativeUtilsCubit extends Cubit<NativeUtilsState> {
  NativeUtilsCubit() : super(const NativeUtilsState()) {
    loadNativeUtils();
  }

  Future<void> loadNativeUtils() async {
    emit(state.copyWith(loading: true));
    final mode = await NativeUtils.getNavigationBarInteractionMode();
    final isAndroidVersion15orHigher = await NativeUtils.isAndroidVersion15orHigher();
    emit(
      state.copyWith(
        loading: false,
        mode: mode,
        isAndroidVersion15orHigher: isAndroidVersion15orHigher,
      ),
    );
  }
}

class NativeUtilsState extends Equatable {
  const NativeUtilsState({
    this.loading = false,
    this.mode = NavigationBarInteractionMode.unknown,
    this.isAndroidVersion15orHigher,
  });

  bool get isAndroid15andThreeNav =>
      mode == NavigationBarInteractionMode.threeButton && (isAndroidVersion15orHigher ?? false);
  final bool loading;
  final NavigationBarInteractionMode? mode;
  final bool? isAndroidVersion15orHigher;

  NativeUtilsState copyWith({
    bool? loading,
    NavigationBarInteractionMode? mode,
    bool? isAndroidVersion15orHigher,
  }) {
    return NativeUtilsState(
      loading: loading ?? this.loading,
      mode: mode ?? this.mode,
      isAndroidVersion15orHigher: isAndroidVersion15orHigher ?? this.isAndroidVersion15orHigher,
    );
  }

  @override
  List<Object?> get props => [loading, mode, isAndroidVersion15orHigher];
}
