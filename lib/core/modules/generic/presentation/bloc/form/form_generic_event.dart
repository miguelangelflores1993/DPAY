import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/core/modules/generic/presentation/bloc/base/base_event.dart';

/// [Result] is the data returned by the UseCase
sealed class FormGenericEvent<Result, Params> extends BaseEvent {
  const FormGenericEvent();
}

class SubmitEvent<Result, Params> extends FormGenericEvent<Result, Params> {
  const SubmitEvent(this.useCase, {required this.params});

  final UseCase<Result, Params> useCase;
  final Params params;

  @override
  List<Object?> get props => [useCase, params];
}
