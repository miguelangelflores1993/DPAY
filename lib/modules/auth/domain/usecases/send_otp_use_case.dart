import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class SendOtpUseCase implements UseCase<bool, NoParams> {
  SendOtpUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponseBool call(NoParams params) {
    return repository.sendOtp();
  }
}
