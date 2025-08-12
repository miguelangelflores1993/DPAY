import 'package:app/modules/auth/data/models/auth_model.dart';
import 'package:app/modules/auth/data/models/user_model.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/get_profile_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signUp(ParamsAuthRegister params);
  Future<AuthModel> signIn(ParamsAuthLogin params);
  Future<bool> otpVerification(JSON params);
  Future<bool> sendOtp(JSON params);
  Future<bool> changePassword(
    ParamsChangePassword params,
  );
  Future<bool> forgotPassword(ParamsForgotPassword params);
  Future<UserModel?> getProfile(ParamsGetProfile params);
}
