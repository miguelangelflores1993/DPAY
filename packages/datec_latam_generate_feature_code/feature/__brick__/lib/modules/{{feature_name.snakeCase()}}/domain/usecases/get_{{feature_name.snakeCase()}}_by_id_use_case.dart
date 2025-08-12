import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../repository/{{feature_name.snakeCase()}}_repository.dart';

class Get{{feature_name.pascalCase()}}UseCase implements UseCase<{{feature_name.pascalCase()}}, String> {
  Get{{feature_name.pascalCase()}}UseCase(this.repository);

  final {{feature_name.pascalCase()}}Repository repository;

  @override
  ApiResponse<{{feature_name.pascalCase()}}> call(String id) {
    return repository.get(id);
  }
} 