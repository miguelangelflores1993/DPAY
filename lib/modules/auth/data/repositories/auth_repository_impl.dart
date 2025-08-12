import 'package:app/core/common/repository_base.dart';

import 'package:app/modules/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/modules/auth/data/models/auth_model.dart';
import 'package:app/modules/auth/data/models/user_model.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/get_profile_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';

class AuthRepositoryImplementation with AuthRepositoryMixin, SimpleRepositoryMixin implements AuthRepository {
  AuthRepositoryImplementation(this.authDataSource);

  final AuthRemoteDataSource authDataSource;

  @override
  ApiResponse<AuthModel> signIn(ParamsAuthLogin params) => execute(() async {
    final result = await authDataSource.signIn(params);
    await saveAuthSession(result);
    return result;
  });

  @override
  ApiResponse<AuthModel> signUp(ParamsAuthRegister params) => execute(() async {
    final result = await authDataSource.signUp(params);
    await saveAuthSession(result);
    return result;
  });

  @override
  ApiResponse<AuthModel?> getUser() => execute(getLocalUser);

  @override
  ApiResponseVoid logout() => execute(clearLocalSession);

  @override
  ApiResponseBool otpVerification(String code) => executeWithCustomerId(
    (customerId) => authDataSource.otpVerification({
      'verificationCode': code,
      'userId': customerId,
    }),
  );

  @override
  ApiResponseBool sendOtp() => executeWithCustomerId((customerId) => authDataSource.sendOtp({'userId': customerId}));

  @override
  ApiResponseBool changePassword(ParamsChangePassword params) =>
      executeWithCustomerId((customerId) => authDataSource.changePassword(params));

  @override
  ApiResponseBool forgotPassword(ParamsForgotPassword params) => execute(() => authDataSource.forgotPassword(params));

  @override
  ApiResponse<UserModel?> getProfile(ParamsGetProfile params) => executeWithCustomerId((customerId) => 
    authDataSource.getProfile(ParamsGetProfile(userId: customerId))
  );
}
