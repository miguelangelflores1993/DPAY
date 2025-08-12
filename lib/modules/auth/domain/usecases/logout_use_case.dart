import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  LogoutUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponseVoid call(NoParams params) {
    return repository.logout();
  }
}
