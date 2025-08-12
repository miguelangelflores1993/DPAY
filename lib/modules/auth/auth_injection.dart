import 'package:app/core/local/key_value_storage_service.dart';
import 'package:app/modules/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/modules/auth/data/datasources/local/auth_local_data_source_impl.dart';
import 'package:app/modules/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/modules/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:app/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:app/modules/auth/domain/usecases/get_profile_use_case.dart';
import 'package:app/modules/auth/domain/usecases/get_user_use_case.dart';
import 'package:app/modules/auth/domain/usecases/logout_use_case.dart';
import 'package:app/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:app/modules/auth/domain/usecases/verify_otp_use_case.dart';
import 'package:app/modules/auth/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:app/modules/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:app/modules/auth/presentation/pages/logout/logout_bloc.dart';
import 'package:app/modules/auth/presentation/pages/menu/bloc/menu_bloc.dart';
import 'package:app/modules/auth/presentation/pages/menu/get_profile_bloc.dart';
import 'package:app/modules/auth/presentation/pages/otp/bloc/otp_verification_bloc.dart';
import 'package:app/modules/auth/presentation/pages/otp/bloc/send_otp_bloc.dart';
import 'package:app/modules/auth/presentation/pages/register/bloc/register_bloc.dart';
import 'package:app/modules/auth/presentation/pages/security/bloc/change_password_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:networking_flutter_dio/core/networking/api_service.dart';

void initAuthInjection(GetIt sl) {
  // Bloc
  sl
    ..registerFactory(RegisterBloc.new)
    ..registerFactory(LoginBloc.new)
    ..registerFactory(OtpVerificationBloc.new)
    ..registerFactory(SendOtpBloc.new)
    ..registerFactory(UserBloc.new)
    ..registerFactory(LogoutBloc.new)
    ..registerFactory(ChangePasswordBloc.new)
    ..registerFactory(ForgotPasswordBloc.new)
    ..registerFactory(GetProfileBloc.new)
    // Use cases
    ..registerLazySingleton(() => SignInUseCase(sl()))
    ..registerLazySingleton(() => SignUpUseCase(sl()))
    ..registerLazySingleton(() => GetUserUseCase(sl()))
    ..registerLazySingleton(() => VerifyOtpUseCase(sl()))
    ..registerLazySingleton(() => SendOtpUseCase(sl()))
    ..registerLazySingleton(() => LogoutUseCase(sl()))
    ..registerLazySingleton(() => ChangePasswordUseCase(sl()))
    ..registerLazySingleton(() => ForgotPasswordUseCase(sl()))
    ..registerLazySingleton(() => GetProfileUseCase(sl()))
    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplementation(sl()),
    )
    // Data sources
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        api: sl<ApiService>(instanceName: 'identityService'),
      ),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(api: KeyValueStorageService()),
    );
}
