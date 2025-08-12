import 'package:app/modules/{{feature_name.snakeCase()}}/domain/usecases/create_{{feature_name.snakeCase()}}_use_case.dart';
import 'package:app/modules/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  Future<List<{{feature_name.pascalCase()}}Model>> getAll();
  Future<{{feature_name.pascalCase()}}Model> post(Create{{feature_name.pascalCase()}}Params params);
  Future<{{feature_name.pascalCase()}}Model> get(String id);
}