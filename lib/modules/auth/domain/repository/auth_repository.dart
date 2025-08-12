import 'package:app/core/common/repository_base.dart';
import 'package:app/modules/auth/data/models/user_model.dart';

import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/get_profile_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';

abstract class AuthRepository {
  ApiResponse<AuthEntity> signUp(ParamsAuthRegister params);
  ApiResponse<AuthEntity> signIn(ParamsAuthLogin params);
  ApiResponse<AuthEntity?> getUser();
  ApiResponseBool otpVerification(String params);
  ApiResponseBool sendOtp();
  ApiResponseVoid logout();
  ApiResponseBool changePassword(ParamsChangePassword params);
  ApiResponseBool forgotPassword(ParamsForgotPassword params);
  ApiResponse<UserModel?> getProfile(ParamsGetProfile params);
}
