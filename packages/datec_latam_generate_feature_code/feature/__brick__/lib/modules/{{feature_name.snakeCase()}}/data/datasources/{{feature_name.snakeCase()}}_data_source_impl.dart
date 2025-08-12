import '{{feature_name.snakeCase()}}_data_source.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';
import 'package:networking_flutter_dio/core/networking/api_config.dart';
import 'package:networking_flutter_dio/core/networking/api_service.dart';
import 'package:app/modules/{{feature_name.snakeCase()}}/domain/usecases/create_{{feature_name.snakeCase()}}_use_case.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';


class {{feature_name.pascalCase()}}DataSourceImpl extends {{feature_name.pascalCase()}}RemoteDataSource {
  {{feature_name.pascalCase()}}DataSourceImpl({required this.api});

  final ApiService api;

  @override
  Future<List<{{feature_name.pascalCase()}}Model>> getAll() async {
    final data = await api.getCollectionData<{{feature_name.pascalCase()}}Model>(
      endpoint: '/api',
      collectionKey: '{{feature_name.snakeCase()}}',
      requiresAuthToken: false,
      converter: {{feature_name.pascalCase()}}Model.fromJson,
    );
    return data.items;
  }
  @override
  Future<{{feature_name.pascalCase()}}Model> post(Create{{feature_name.pascalCase()}}Params params) async {
    final data = await api.setData<{{feature_name.pascalCase()}}Model>(
      endpoint: '/api',
      requiresAuthToken: false,
      data: params.toJson(),
      converter: (response) => {{feature_name.pascalCase()}}Model.fromJson(response.body['result'] as JSON),
    );
    return data;
  }
   @override
  Future<{{feature_name.pascalCase()}}Model> get(String id) async {
    final data = await api.getDocumentData<{{feature_name.pascalCase()}}Model>(
      endpoint: '/api',
      requiresAuthToken: false,
      queryParams: {'id': id},
      converter: (data) => {{feature_name.pascalCase()}}Model.fromJson(data['result'] as JSON),
    );
    return data;
  }
}
