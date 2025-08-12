import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../repository/{{feature_name.snakeCase()}}_repository.dart';

class Create{{feature_name.pascalCase()}}UseCase implements UseCase<{{feature_name.pascalCase()}}, Create{{feature_name.pascalCase()}}Params> {
  Create{{feature_name.pascalCase()}}UseCase(this.repository);

  final {{feature_name.pascalCase()}}Repository repository;

  @override
  ApiResponse<{{feature_name.pascalCase()}}> call(Create{{feature_name.pascalCase()}}Params params) {
    return repository.post(params);
  }
}

class Create{{feature_name.pascalCase()}}Params {
  final int id;
  const Create{{feature_name.pascalCase()}}Params({
    required this.id,
  });
  Map<String, dynamic> toJson() {
    return {
        'id': id,
    };
  }
} 