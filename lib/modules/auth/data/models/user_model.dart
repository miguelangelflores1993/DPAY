import 'package:app/modules/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.customerId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.type,
    required super.userId,
    required super.createdOn,
    required super.updatedOn,
    required super.createdBy,
    required super.updatedBy,
    required super.entityStatus,
    required super.isEmailConfirmed,
    super.identificationType,
    super.identificationNumber,
    super.nationality,
    super.state,
    super.stats,
    super.dateOfBirth,
    super.deletedOn,
    super.tenantId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      customerId: json['customerId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      type: json['type'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      createdOn: json['createdOn'] != null
          ? DateTime.parse(json['createdOn'] as String)
          : DateTime.now(),
      updatedOn: json['updatedOn'] != null
          ? DateTime.parse(json['updatedOn'] as String)
          : DateTime.now(),
      createdBy: json['createdBy'] as String? ?? '',
      updatedBy: json['updatedBy'] as String? ?? '',
      entityStatus: json['entityStatus'] as String? ?? '',
      isEmailConfirmed: json['isEmailConfirmed'] as bool? ?? false,
      identificationType: json['identificationType'] as String? ?? '',
      identificationNumber: json['identificationNumber'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      state: json['state'] as String? ?? '',
      stats: json['stats'] as Map<String, dynamic>? ?? {},
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'] as String)
          : null,
      deletedOn: json['deletedOn'] != null
          ? DateTime.tryParse(json['deletedOn'] as String)
          : null,
      tenantId: json['tenantId'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'type': type,
      'userId': userId,
      'createdOn': createdOn.toIso8601String(),
      'updatedOn': updatedOn.toIso8601String(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'entityStatus': entityStatus,
      'isEmailConfirmed': isEmailConfirmed,
      'identificationType': identificationType,
      'identificationNumber': identificationNumber,
      'nationality': nationality,
      'state': state,
      'stats': stats,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'deletedOn': deletedOn?.toIso8601String(),
      'tenantId': tenantId,
    };
  }

  @override
  String toString() {
    return 'UserModel(email: $email, firstName: $firstName, lastName: $lastName, isEmailConfirmed: $isEmailConfirmed)';
  }
}
