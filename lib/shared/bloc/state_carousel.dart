// carousel_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselState {
  CarouselState({required this.currentIndex, required this.isPlaying});
  final int currentIndex;
  final bool isPlaying;

  CarouselState copyWith({int? currentIndex, bool? isPlaying}) {
    return CarouselState(
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit({
    required this.bannerCount,
    required this.autoPlayDuration,
    this.initialIndex = 0,
  }) : super(CarouselState(currentIndex: initialIndex, isPlaying: true)) {
    _startAutoPlay();
  }

  final int bannerCount;
  final int initialIndex;
  final Duration autoPlayDuration;

  Timer? _timer;

  void _startAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(autoPlayDuration, (_) {
      if (state.isPlaying) {
        final nextIndex = (state.currentIndex + 1) % bannerCount;
        emit(state.copyWith(currentIndex: nextIndex));
      }
    });
  }

  void togglePlay() {
    final newState = !state.isPlaying;
    emit(state.copyWith(isPlaying: newState));
    if (newState) {
      _startAutoPlay();
    } else {
      _timer?.cancel();
    }
  }

  void goTo(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
