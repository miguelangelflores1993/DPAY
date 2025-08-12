import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class VerifyOtpUseCase implements UseCase<bool, String> {
  VerifyOtpUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponseBool call(String params) {
    return repository.otpVerification(params);
  }
}
