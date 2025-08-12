import 'package:app/core/common/repository_base.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/modules/auth/data/models/user_model.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';

class GetProfileUseCase implements UseCase<UserModel?, ParamsGetProfile> {
  GetProfileUseCase(this.repository);

  final AuthRepository repository;

  @override
  ApiResponse<UserModel?> call(ParamsGetProfile params) {
    return repository.getProfile(params);
  }
}

class ParamsGetProfile {
  ParamsGetProfile({this.userId});

  final String? userId;

  Map<String, dynamic> toJson() => {'userId': userId};
}
