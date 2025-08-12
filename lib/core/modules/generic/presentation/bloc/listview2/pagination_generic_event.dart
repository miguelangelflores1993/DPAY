import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/core/modules/generic/presentation/bloc/base/base_event.dart';
import 'package:app/core/modules/generic/presentation/bloc/listview2/filters.dart';

/// [Result] is the data returned by the UseCase
sealed class ListViewGenericEvent<Result, Params> extends BaseEvent {
  const ListViewGenericEvent();
}

class LoadInitialEvent<Result, Params> extends ListViewGenericEvent<Result, Params> {
  const LoadInitialEvent({
    required this.useCase,
    this.params,
    this.fechInitial = true,
  });
  final bool fechInitial;
  final UseCase<List<Result>, GenericQueryBuilder> useCase;
  final GenericQueryBuilder? params;

  @override
  List<Object?> get props => [useCase];
}

class RefreshEvent<Result, Params> extends ListViewGenericEvent<Result, Params> {
  const RefreshEvent({required this.useCase, this.params});

  final UseCase<List<Result>, GenericQueryBuilder> useCase;
  final GenericQueryBuilder? params;
  @override
  List<Object?> get props => [useCase];
}
