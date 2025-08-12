import 'package:app/modules/auth/data/models/user_model.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.user,
    required super.customerId,
    required super.accessToken,
    required super.refreshToken,
  });
  factory AuthModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('JSON cannot be null');
    }
    return AuthModel(
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as JSON)
          : UserModel(
              customerId: '',
              firstName: '',
              lastName: '',
              email: '',
              phone: '',
              type: '',
              userId: '',
              createdOn: DateTime.now(),
              updatedOn: DateTime.now(),
              createdBy: '',
              updatedBy: '',
              entityStatus: '',
              isEmailConfirmed: false,
            ),
      customerId: json['customerId'] as String? ?? '',
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );
  }
  AuthModel copyWith({
    UserModel? user,
    String? customerId,
    String? accessToken,
    String? refreshToken,
  }) => AuthModel(
    user: user ?? this.user,
    customerId: customerId ?? this.customerId,
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
  );

  Map<String, dynamic> toJson() {
    return {
      'user': (user as UserModel).toJson(),
      'customerId': customerId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  AuthEntity toEntity() {
    return AuthEntity(
      user: user,
      customerId: customerId,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  List<Object?> get props => [user, customerId, accessToken, refreshToken];

  @override
  String toString() {
    return 'AuthModel(user: $user, customerId: $customerId, accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}
