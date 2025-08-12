import 'package:app/core/modules/generic/presentation/bloc/base/base_state.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

class FormBaseState<Result> extends BaseState {
  const FormBaseState({required super.status, super.error, this.data});
  factory FormBaseState.initial() =>
      FormBaseState<Result>(status: AppStatus.initial);
  final Result? data;

  FormBaseState<Result> copyWith({
    AppStatus? status,
    ValueGetter<CustomException?>? error,
    ValueGetter<Result?>? data,
  }) {
    return FormBaseState<Result>(
      status: status ?? this.status,
      error: error != null ? error() : this.error,
      data: data != null ? data() : this.data,
    );
  }

  @override
  List<Object?> get props => [...super.props, data];
}
