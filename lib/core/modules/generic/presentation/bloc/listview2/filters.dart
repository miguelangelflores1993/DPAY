class RangeFilter {
  RangeFilter({this.gt, this.gte, this.lt, this.lte});
  double? gt;
  double? gte;
  double? lt;
  double? lte;

  Map<String, String> toQuery(String field) {
    final result = <String, String>{};
    if (gt != null) result['filter[$field][gt]'] = gt.toString();
    if (gte != null) result['filter[$field][gte]'] = gte.toString();
    if (lt != null) result['filter[$field][lt]'] = lt.toString();
    if (lte != null) result['filter[$field][lte]'] = lte.toString();
    return result;
  }
}

/// Representa un filtro por lista de valores, como colores o tallas
class ListFilter {
  ListFilter(this.values);
  final List<String> values;

  Map<String, List<String>> toQuery(String field) {
    return {'filter[$field][]': values};
  }
}

/// Interfaz abstracta para adaptadores de API
abstract class ApiAdapter {
  /// Nombre del parámetro de página para esta API específica
  String get pageParameterName;

  /// Nombre del parámetro de tamaño de página (opcional)
  String? get pageSizeParameterName => null;

  /// Tamaño de página por defecto
  int get defaultPageSize => 10;

  /// Página inicial (algunas APIs empiezan en 0, otras en 1)
  int get initialPage => 1;

  /// Construye los parámetros base para la paginación
  Map<String, dynamic> buildPaginationParams(int page, int? pageSize) {
    final params = <String, dynamic>{
      pageParameterName: page.toString(),
    };

    if (pageSizeParameterName != null && pageSize != null) {
      params[pageSizeParameterName!] = pageSize.toString();
    }

    return params;
  }

  /// Hook para modificar parámetros adicionales específicos de la API
  Map<String, dynamic> transformParams(Map<String, dynamic> params) => params;

  /// Construye la URI completa para la API
  Uri buildUri(String baseUrl, String endpoint, Map<String, dynamic> params);

  /// Determina si hay más páginas basado en la respuesta
  bool hasMorePages(List<dynamic> response, int currentPage);
}

class DoofinderApiAdapter extends ApiAdapter {
  DoofinderApiAdapter();

  @override
  String get pageParameterName => 'page';

  @override
  int get defaultPageSize => 10;

  @override
  Uri buildUri(String baseUrl, String endpoint, Map<String, dynamic> params) {
    return Uri.https(baseUrl, '/v1/search/', params);
  }

  @override
  bool hasMorePages(List<dynamic> response, int currentPage) {
    return response.isNotEmpty;
  }
}

class StandardApiAdapter extends ApiAdapter {
  StandardApiAdapter();

  @override
  String get pageParameterName => 'pageNumber';

  @override
  String get pageSizeParameterName => 'pageSize';

  @override
  int get initialPage => 1;

  @override
  int get defaultPageSize => 10;

  @override
  Uri buildUri(String baseUrl, String endpoint, Map<String, dynamic> params) {
    return Uri.https(baseUrl);
  }

  @override
  bool hasMorePages(List<dynamic> response, int currentPage) {
    return response.length >= defaultPageSize;
  }
}

class RestApiAdapter extends ApiAdapter {
  RestApiAdapter({required this.endpoint, this.totalPages});
  final String endpoint;
  final int? totalPages;

  @override
  String get pageParameterName => 'page';

  @override
  String get pageSizeParameterName => 'limit';

  @override
  Uri buildUri(String baseUrl, String endpoint, Map<String, dynamic> params) {
    return Uri.https(baseUrl, this.endpoint, params);
  }

  @override
  bool hasMorePages(List<dynamic> response, int currentPage) {
    if (totalPages != null) {
      return currentPage < totalPages!;
    }
    return response.length >= defaultPageSize;
  }
}

class GenericQueryBuilder {
  GenericQueryBuilder({required this.adapter});
  final Map<String, RangeFilter> rangeFilters = {};
  final Map<String, ListFilter> listFilters = {};
  final Map<String, dynamic> otherParams = {};
  final List<String> indices = [];
  final ApiAdapter adapter;

  // Información interna de paginación
  int? _currentPage;
  int? _pageSize;

  void addRangeFilter(String field, RangeFilter filter) {
    rangeFilters[field] = filter;
  }

  void addListFilter(String field, ListFilter filter) {
    listFilters[field] = filter;
  }

  void addOtherParam(String key, String value) {
    otherParams[key] = value;
  }

  void addParams(Map<String, dynamic> newParams) {
    otherParams.addAll(newParams);
  }

  void addIndex(String index) {
    indices.add(index);
  }

  // Método para configurar la paginación internamente
  void setPageInfo(int page, int? pageSize) {
    _currentPage = page;
    _pageSize = pageSize;
  }

  Map<String, dynamic> toParams() {
    final params = <String, dynamic>{};

    // Parámetros de paginación específicos del adaptador
    if (_currentPage != null) {
      params.addAll(adapter.buildPaginationParams(_currentPage!, adapter.defaultPageSize));
    }

    // Filtros de rango
    for (final entry in rangeFilters.entries) {
      params.addAll(entry.value.toQuery(entry.key));
    }

    // Filtros de lista
    for (final entry in listFilters.entries) {
      params.addAll(entry.value.toQuery(entry.key));
    }

    // Otros parámetros
    params.addAll(otherParams);

    // Índices (específico para Doofinder)
    for (var i = 0; i < indices.length; i++) {
      params['indices[$i]'] = indices[i];
    }

    // Transformar parámetros usando el adaptador
    return adapter.transformParams(params);
  }

  Uri buildUri({required String baseUrl, required String endpoint}) {
    final queryParams = toParams();
    return adapter.buildUri(baseUrl, endpoint, queryParams);
  }

  // Getter para acceder a la página actual
  int? get currentPage => _currentPage;

  // Getter para acceder al tamaño de página
  int? get pageSize => _pageSize;
}
