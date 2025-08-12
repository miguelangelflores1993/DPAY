import 'package:app/core/common/usecases/usecase.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../repository/{{feature_name.snakeCase()}}_repository.dart';
import 'package:app/core/common/repository_base.dart';

class GetAll{{feature_name.pascalCase()}}UseCase implements UseCase<List<{{feature_name.pascalCase()}}>, NoParams> {
  GetAll{{feature_name.pascalCase()}}UseCase(this.repository);

  final {{feature_name.pascalCase()}}Repository repository;

  @override
  ApiResponse<List<{{feature_name.pascalCase()}}>> call(NoParams params) {
    return repository.getAll();
  }
}