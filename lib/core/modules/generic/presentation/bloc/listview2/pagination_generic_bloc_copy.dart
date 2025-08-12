// import 'package:app/core/modules/generic/presentation/bloc/listview2/pagination_generic_event.dart';
// import 'package:app/core/modules/generic/presentation/bloc/listview2/pagination_generic_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

// /// Representa un filtro de rango como gt, gte, lt, lte
// class RangeFilter {
//   RangeFilter({this.gt, this.gte, this.lt, this.lte});
//   double? gt;
//   double? gte;
//   double? lt;
//   double? lte;

//   Map<String, String> toQuery(String field) {
//     final result = <String, String>{};
//     if (gt != null) result['filter[$field][gt]'] = gt.toString();
//     if (gte != null) result['filter[$field][gte]'] = gte.toString();
//     if (lt != null) result['filter[$field][lt]'] = lt.toString();
//     if (lte != null) result['filter[$field][lte]'] = lte.toString();
//     return result;
//   }
// }

// class GenericQueryBuilder {
//   final Map<String, RangeFilter> rangeFilters = {};
//   final Map<String, ListFilter> listFilters = {};
//   final Map<String, dynamic> otherParams = {};
//   final List<String> indices = [];

//   void addRangeFilter(String field, RangeFilter filter) {
//     rangeFilters[field] = filter;
//   }

//   void addListFilter(String field, ListFilter filter) {
//     listFilters[field] = filter;
//   }

//   void addOtherParam(String key, String value) {
//     otherParams[key] = value;
//   }

//   void addParams(Map<String, dynamic> newParams) {
//     otherParams.addAll(newParams);
//   }

//   void addIndex(String index) {
//     indices.add(index);
//   }

//   Map<String, dynamic> toParams() {
//     final params = <String, dynamic>{};

//     // Rango
//     for (final entry in rangeFilters.entries) {
//       params.addAll(entry.value.toQuery(entry.key));
//     }

//     // Listas
//     for (final entry in listFilters.entries) {
//       params.addAll(entry.value.toQuery(entry.key));
//     }

//     // Otros
//     params.addAll(otherParams);

//     // Índices
//     for (var i = 0; i < indices.length; i++) {
//       params['indices[$i]'] = indices[i];
//     }

//     return params;
//   }

//   Uri buildUri({required String baseUrl, required String hashId}) {
//     final queryParams = <String, dynamic>{};

//     for (final entry in rangeFilters.entries) {
//       queryParams.addAll(entry.value.toQuery(entry.key));
//     }

//     for (final entry in listFilters.entries) {
//       queryParams.addAll(entry.value.toQuery(entry.key));
//     }

//     for (final entry in otherParams.entries) {
//       queryParams[entry.key] = entry.value;
//     }

//     for (var i = 0; i < indices.length; i++) {
//       queryParams['indices[$i]'] = indices[i];
//     }

//     return Uri.https(baseUrl, '/v1/search/$hashId', queryParams);
//   }
// }

// /// Representa un filtro por lista de valores, como colores o tallas
// class ListFilter {
//   ListFilter(this.values);
//   final List<String> values;

//   Map<String, List<String>> toQuery(String field) {
//     return {'filter[$field][]': values};
//   }
// }

// abstract class ListViewtBloc<Result, Params extends GenericQueryBuilder>
//     extends Bloc<ListViewGenericEvent<Result, Params>, ListViewState<Result>> {
//   ListViewtBloc() : super(ListViewState<Result>.initial()) {
//     on<LoadInitialEvent<Result, Params>>(_loadInitialEvent);
//     on<RefreshEvent<Result, Params>>(_refreshEvent);
//   }

//   /// Override para definir el tamaño de página por defecto si no viene de Params
//   int get pageSize => 20;

//   ListViewState<Result> toLoading(ListViewState<Result> state) {
//     return state.copyWith(
//       pagingState: state.pagingState.copyWith(isLoading: true),
//     );
//   }

//   ListViewState<Result> toError(
//     ListViewState<Result> state,
//     CustomException error,
//   ) {
//     return state.copyWith(
//       pagingState: state.pagingState.copyWith(
//         isLoading: false,
//         error: () => error,
//       ),
//     );
//   }

//   Future<void> _refreshEvent(
//     RefreshEvent<Result, Params> event,
//     Emitter<ListViewState<Result>> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         pagingState: state.pagingState.copyWith(isLoading: true, error: null),
//         query: event.params,
//       ),
//     );
//     const newKey = 1;
//     final queryBuilder = GenericQueryBuilder()
//       ..addOtherParam('page', newKey.toString())
//       ..addParams(state.query?.toParams() ?? {'query': ''});
//     final result = await event.useCase.call(queryBuilder);

//     result.fold((err) => emit(toError(state, err)), (res) {
//       emit(
//         state.copyWith(
//           pagingState: state.pagingState.copyWith(
//             pages: [res],
//             keys: [newKey],
//             isLoading: false,
//           ),
//         ),
//       );
//     });
//   }

//   Future<void> _loadInitialEvent(
//     LoadInitialEvent<Result, Params> event,
//     Emitter<ListViewState<Result>> emit,
//   ) async {
//     if (!event.fechInitial && event.params == null) {
//       emit(
//         state.copyWith(
//           pagingState: state.pagingState.copyWith(
//             isLoading: false,
//             error: null,
//             pages: [],
//             keys: [],
//             hasNextPage: false,
//           ),
//         ),
//       );
//       return;
//     }
//     if (state.pagingState.isLoading) return;

//     emit(
//       state.copyWith(
//         pagingState: state.pagingState.copyWith(
//           isLoading: true,
//           error: null,
//           hasNextPage: true,
//         ),
//         query: event.params,
//       ),
//     );
//     final newKey = (state.pagingState.keys?.last ?? 0) + 1;
//     final queryBuilder = GenericQueryBuilder()
//       ..addOtherParam('page', newKey.toString())
//       ..addParams(state.query?.toParams() ?? {'query': ''});

//     final result = await event.useCase.call(queryBuilder);

//     result.fold(
//       (err) {
//         print(err);
//         emit(toError(state, err));
//       },
//       (res) {
//         final isLastPage = res.isEmpty;
//         emit(
//           state.copyWith(
//             pagingState: state.pagingState.copyWith(
//               pages: [...?state.pagingState.pages, res],
//               keys: [...?state.pagingState.keys, newKey],
//               hasNextPage: !isLastPage,
//               isLoading: false,
//             ),
//           ),
//         );
//       },
//       // (res) => emit(

//       //   state.copyWith(
//       //     status: AppStatus.success,
//       //     items: res,
//       //     page: initialPage + 1,
//       //     hasReachedMax: res.length < pageSize,
//       //   ),
//       // ),
//     );
//   }
// }
