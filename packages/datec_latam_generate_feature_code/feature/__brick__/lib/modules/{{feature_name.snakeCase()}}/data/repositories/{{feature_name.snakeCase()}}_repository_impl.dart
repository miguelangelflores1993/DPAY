import 'package:app/core/common/repository_base.dart';
import '../datasources/{{feature_name.snakeCase()}}_data_source.dart';
import '../../domain/repository/{{feature_name.snakeCase()}}_repository.dart';
import 'package:app/modules/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
import 'package:app/modules/{{feature_name.snakeCase()}}/domain/usecases/create_{{feature_name.snakeCase()}}_use_case.dart';

class {{feature_name.pascalCase()}}RepositoryImpl with AuthRepositoryMixin, SimpleRepositoryMixin implements {{feature_name.pascalCase()}}Repository {
  {{feature_name.pascalCase()}}RepositoryImpl({required this.{{feature_name.camelCase()}}DataSource});

  final {{feature_name.pascalCase()}}RemoteDataSource {{feature_name.camelCase()}}DataSource;
  
  @override
  ApiResponseList<{{feature_name.pascalCase()}}Model> getAll() => execute({{feature_name.camelCase()}}DataSource.getAll);

  @override
  ApiResponse<{{feature_name.pascalCase()}}Model> post(Create{{feature_name.pascalCase()}}Params params) => execute(() => {{feature_name.camelCase()}}DataSource.post(params));

  @override
  ApiResponse<{{feature_name.pascalCase()}}Model> get(String id) => execute(() => {{feature_name.camelCase()}}DataSource.get(id));

}