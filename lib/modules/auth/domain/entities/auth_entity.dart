import 'package:app/modules/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.user,
    required this.customerId,
    required this.accessToken,
    required this.refreshToken,
  });
  final UserEntity user;
  final String customerId;
  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [user, customerId, accessToken, refreshToken];

  @override
  String toString() {
    return 'AuthEntity(user: $user, customerId: $customerId, accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}
