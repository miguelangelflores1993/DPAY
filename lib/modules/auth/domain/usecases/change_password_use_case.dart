import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class ChangePasswordUseCase implements UseCase<bool, ParamsChangePassword> {
  ChangePasswordUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponseBool call(ParamsChangePassword params) {
    return repository.changePassword(params);
  }
}

class ParamsChangePassword {
  ParamsChangePassword({required this.currentPassword, required this.newPassword});

  String currentPassword;
  String newPassword;

  ParamsChangePassword copyWith({String? currentPassword, String? newPassword}) => ParamsChangePassword(
    currentPassword: currentPassword ?? this.currentPassword,
    newPassword: newPassword ?? this.newPassword,
  );

  Map<String, dynamic> toJson() => {'currentPassword': currentPassword, 'newPassword': newPassword};
}
