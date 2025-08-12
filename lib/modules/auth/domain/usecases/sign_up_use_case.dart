import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class SignUpUseCase implements UseCase<AuthEntity, ParamsAuthRegister> {
  SignUpUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponse<AuthEntity> call(ParamsAuthRegister params) {
    return repository.signUp(params);
  }
}

class ParamsAuthRegister {
  ParamsAuthRegister({
    required this.firstName,
    required this.lastName,
    required this.source,
    required this.email,
    required this.password,
    required this.phone,
    this.roles = const [],
  });
  String firstName;
  String lastName;
  String source;
  String email;
  String password;
  List<String> roles;
  String phone;
  ParamsAuthRegister copyWith({
    String? firstName,
    String? lastName,
    String? source,
    String? email,
    String? password,
    List<String>? roles,
    String? phone,
  }) => ParamsAuthRegister(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    source: source ?? this.source,
    email: email ?? this.email,
    password: password ?? this.password,
    roles: roles ?? this.roles,
    phone: phone ?? this.phone,
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'source': source,
    'email': email,
    'password': password,
    'phone': phone,
  };
}
