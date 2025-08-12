import 'package:fpdart/fpdart.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';
import 'package:app/core/common/repository_base.dart';
import 'package:app/modules/{{feature_name.snakeCase()}}/domain/usecases/create_{{feature_name.snakeCase()}}_use_case.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  ApiResponseList<{{feature_name.pascalCase()}}> getAll();
  ApiResponse<{{feature_name.pascalCase()}}> post(Create{{feature_name.pascalCase()}}Params params);
  ApiResponse<{{feature_name.pascalCase()}}> get(String id);
}
