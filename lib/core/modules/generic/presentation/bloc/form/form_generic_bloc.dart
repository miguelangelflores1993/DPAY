import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_event.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

abstract class FormGenericBloc<Result, Params>
    extends Bloc<FormGenericEvent<Result, Params>, FormBaseState<Result>> {
  FormGenericBloc() : super(FormBaseState<Result>.initial()) {
    on<SubmitEvent<Result, Params>>(_handleSubmit);
  }

  FormBaseState<Result> toLoading(FormBaseState<Result> currentState) {
    return currentState.copyWith(status: AppStatus.loading);
  }

  FormBaseState<Result> toSuccess(
    FormBaseState<Result> currentState,
    Result data,
  ) {
    return currentState.copyWith(status: AppStatus.success, data: () => data);
  }

  FormBaseState<Result> toError(
    FormBaseState<Result> currentState,
    CustomException error,
  ) {
    return currentState.copyWith(status: AppStatus.error, error: () => error);
  }

  Future<void> _handleSubmit(
    SubmitEvent<Result, Params> event,
    Emitter<FormBaseState<Result>> emit,
  ) async {
    emit(toLoading(state));
    final result = await event.useCase.call(event.params);
    result.fold(
      (err) => emit(toError(state, err)),
      (res) => emit(toSuccess(state, res)),
    );
  }
}
