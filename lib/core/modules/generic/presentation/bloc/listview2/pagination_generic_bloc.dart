import 'dart:developer' as developer;

import 'package:app/core/modules/generic/presentation/bloc/listview2/filters.dart';
import 'package:app/core/modules/generic/presentation/bloc/listview2/pagination_generic_event.dart';
import 'package:app/core/modules/generic/presentation/bloc/listview2/pagination_generic_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

abstract class ListViewtBloc<Result, Params extends GenericQueryBuilder>
    extends Bloc<ListViewGenericEvent<Result, Params>, ListViewState<Result>> {
  ListViewtBloc({required this.apiAdapter}) : super(ListViewState<Result>.initial()) {
    on<LoadInitialEvent<Result, Params>>(_loadInitialEvent);
    on<RefreshEvent<Result, Params>>(_refreshEvent);
  }
  final ApiAdapter apiAdapter;

  /// Override para definir el tamaño de página por defecto

  ListViewState<Result> toLoading(ListViewState<Result> state) {
    return state.copyWith(
      pagingState: state.pagingState.copyWith(isLoading: true),
    );
  }

  ListViewState<Result> toError(
    ListViewState<Result> state,
    CustomException error,
  ) {
    return state.copyWith(
      pagingState: state.pagingState.copyWith(
        isLoading: false,
        error: () => error,
      ),
    );
  }

  Future<void> _refreshEvent(
    RefreshEvent<Result, Params> event,
    Emitter<ListViewState<Result>> emit,
  ) async {
    emit(
      state.copyWith(
        pagingState: PagingState<int, Result>(isLoading: true),
        query: event.params,
      ),
    );

    final newKey = apiAdapter.initialPage;
    final queryBuilder = GenericQueryBuilder(adapter: apiAdapter)
      ..addParams(state.query?.toParams() ?? {})
      ..setPageInfo(newKey, 20);

    final result = await event.useCase.call(queryBuilder);

    result.fold((err) => emit(toError(state, err)), (res) {
      final isLastPage = res.isEmpty;
      emit(
        state.copyWith(
          pagingState: state.pagingState.copyWith(
            pages: [res],
            keys: [newKey],
            isLoading: false,
            hasNextPage: !isLastPage,
          ),
        ),
      );
    });
  }

  Future<void> _loadInitialEvent(
    LoadInitialEvent<Result, Params> event,
    Emitter<ListViewState<Result>> emit,
  ) async {
    if (!event.fechInitial && event.params == null) {
      emit(
        state.copyWith(
          pagingState: state.pagingState.copyWith(
            isLoading: false,
            error: null,
            pages: [],
            keys: [],
            hasNextPage: false,
          ),
        ),
      );
      return;
    }

    if (state.pagingState.isLoading) return;

    emit(
      state.copyWith(
        pagingState: state.pagingState.copyWith(
          isLoading: true,
          error: null,
        ),
        query: event.params,
      ),
    );

    final newKey = (state.pagingState.keys?.last ?? apiAdapter.initialPage - 1) + 1;

    final queryBuilder = GenericQueryBuilder(adapter: apiAdapter)
      ..addParams(state.query?.toParams() ?? {})
      ..setPageInfo(newKey, 10);
    final result = await event.useCase.call(queryBuilder);
    result.fold(
      (err) {
        developer.log(err.toString());
        emit(toError(state, err));
      },
      (res) {
        final isLastPage = res.isEmpty;

        emit(
          state.copyWith(
            pagingState: state.pagingState.copyWith(
              pages: [...?state.pagingState.pages, res],
              keys: [...?state.pagingState.keys, newKey],
              isLoading: false,
              hasNextPage: !isLastPage,
            ),
          ),
        );
      },
    );
  }
}
