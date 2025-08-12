import 'package:app/core/modules/generic/presentation/bloc/listview2/filters.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListViewState<Result> {
  ListViewState({required this.pagingState, this.query});
  factory ListViewState.initial() {
    return ListViewState(pagingState: PagingState<int, Result>());
  }
  final PagingState<int, Result> pagingState;

  final GenericQueryBuilder? query;
  ListViewState<Result> copyWith({
    PagingState<int, Result>? pagingState,
    GenericQueryBuilder? query,
  }) {
    return ListViewState<Result>(
      pagingState: pagingState ?? this.pagingState,
      query: query ?? this.query,
    );
  }
}
