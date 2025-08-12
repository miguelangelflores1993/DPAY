import 'dart:convert';

import 'package:app/modules/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/modules/auth/data/models/auth_model.dart';
import 'package:app/modules/auth/data/models/user_model.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/get_profile_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';
import 'package:networking_flutter_dio/core/networking/api_service.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.api});

  final ApiService api;

  @override
  Future<AuthModel> signUp(ParamsAuthRegister params) async {
    final data = await api.setData<AuthModel>(
      endpoint: '/api/Auth/Register',
      requiresAuthToken: false,
      data: params.toJson(),
      converter: (response) => AuthModel.fromJson(response.body['result'] as JSON),
    );
    return data;
  }

  @override
  Future<AuthModel> signIn(ParamsAuthLogin params) async {
    final data = await api.setData<AuthModel>(
      endpoint: '/api/Auth/Login',
      requiresAuthToken: false,
      data: params.toJson(),
      converter: (response) => AuthModel.fromJson(response.body['result'] as JSON),
    );
    return data;
  }

  @override
  Future<bool> otpVerification(JSON params) async {
    final data = await api.updateData<bool>(
      endpoint: '/api/Auth/VerifyEmail',
      requiresAuthToken: false,
      data: params,
      converter: (response) => response.body['success'] as bool,
    );
    return data;
  }

  @override
  Future<bool> sendOtp(JSON params) async {
    final data = await api.setData<bool>(
      endpoint: '/api/Auth/VerificationCode',
      requiresAuthToken: false,
      data: params,
      converter: (response) => response.body['success'] as bool,
    );
    return data;
  }

  @override
  Future<bool> changePassword(ParamsChangePassword params) async {
    final data = await api.updateData<bool>(
      endpoint: '/api/Auth/ChangePassword',
      data: params.toJson(),
      converter: (response) => response.body['success'] as bool,
    );
    return data;
  }

  @override
  Future<bool> forgotPassword(ParamsForgotPassword params) async {
    final data = await api.setData<bool>(
      endpoint: '/api/Auth/RecoverPassword',
      requiresAuthToken: false,
      data: json.encode(params.email),
      converter: (response) => response.body['success'] as bool,
    );
    return data;
  }

  @override
  Future<UserModel?> getProfile(ParamsGetProfile params) async {
    final data = await api.getDocumentData<UserModel?>(
      endpoint: '/api/User/${params.userId}',
      converter: UserModel.fromJson,
    );
    return data;
  }
}
