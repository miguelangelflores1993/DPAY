import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.type,
    required this.userId,
    required this.createdOn,
    required this.updatedOn,
    required this.createdBy,
    required this.updatedBy,
    required this.entityStatus,
    required this.isEmailConfirmed,
    this.identificationType,
    this.identificationNumber,
    this.nationality,
    this.dateOfBirth,
    this.state,
    this.stats,
    this.deletedOn,
    this.tenantId,
  });

  final String customerId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String type;
  final String userId;
  final DateTime createdOn;
  final DateTime updatedOn;
  final String createdBy;
  final String updatedBy;
  final String entityStatus;
  final bool isEmailConfirmed;

  final String? identificationType;
  final String? identificationNumber;
  final String? nationality;
  final String? state;
  final dynamic stats;
  final DateTime? dateOfBirth;
  final DateTime? deletedOn;
  final String? tenantId;

  String get nameInitials => firstName.substring(0, 1).toUpperCase() + lastName.substring(0, 1).toUpperCase();

  UserEntity copyWith({
    String? customerId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? type,
    String? userId,
    DateTime? createdOn,
    DateTime? updatedOn,
    String? createdBy,
    String? updatedBy,
    String? entityStatus,
    bool? isEmailConfirmed,
    String? identificationType,
    String? identificationNumber,
    String? nationality,
    String? state,
    dynamic stats,
    DateTime? dateOfBirth,
    DateTime? deletedOn,
    String? tenantId,
  }) {
    return UserEntity(
      customerId: customerId ?? this.customerId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      entityStatus: entityStatus ?? this.entityStatus,
      isEmailConfirmed: isEmailConfirmed ?? this.isEmailConfirmed,
      identificationType: identificationType ?? this.identificationType,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      nationality: nationality ?? this.nationality,
      state: state ?? this.state,
      stats: stats ?? this.stats,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      deletedOn: deletedOn ?? this.deletedOn,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  List<Object?> get props => [
    customerId,
    firstName,
    lastName,
    email,
    phone,
    type,
    userId,
    createdOn,
    updatedOn,
    createdBy,
    updatedBy,
    entityStatus,
    isEmailConfirmed,
    identificationType,
    identificationNumber,
    nationality,
    state,
    stats,
    dateOfBirth,
    deletedOn,
    tenantId,
  ];
}
