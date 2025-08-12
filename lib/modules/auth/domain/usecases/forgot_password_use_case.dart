import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase implements UseCase<bool, ParamsForgotPassword> {
  ForgotPasswordUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponseBool call(ParamsForgotPassword params) {
    return repository.forgotPassword(params);
  }
}

class ParamsForgotPassword {
  ParamsForgotPassword({required this.email});

  String email;

  Map<String, dynamic> toJson() => {'email': email};
}
