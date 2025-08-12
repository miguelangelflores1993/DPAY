import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class GetUserUseCase implements UseCase<AuthEntity?, NoParams> {
  GetUserUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponse<AuthEntity?> call(NoParams params) {
    return repository.getUser();
  }
}
