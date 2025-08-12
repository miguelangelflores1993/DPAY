import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class SignInUseCase implements UseCase<AuthEntity, ParamsAuthLogin> {
  SignInUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponse<AuthEntity> call(ParamsAuthLogin params) {
    return repository.signIn(params);
  }
}

class ParamsAuthLogin {
  ParamsAuthLogin({required this.email, required this.password});

  String email;
  String password;

  ParamsAuthLogin copyWith({String? email, String? password}) => ParamsAuthLogin(
    email: email ?? this.email,
    password: password ?? this.password,
  );

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
