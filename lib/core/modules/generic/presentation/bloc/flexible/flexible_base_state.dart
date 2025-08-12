import 'package:app/core/modules/generic/presentation/bloc/base/base_state.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

class FlexibleState extends BaseState {
  const FlexibleState({required super.status, super.error});
  factory FlexibleState.initial() =>
      const FlexibleState(status: AppStatus.initial);

  FlexibleState copyWith({
    AppStatus? status,
    ValueGetter<CustomException?>? error,
  }) {
    return FlexibleState(
      status: status ?? this.status,
      error: error != null ? error() : this.error,
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
