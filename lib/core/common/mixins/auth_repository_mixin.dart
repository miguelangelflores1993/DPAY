import 'package:app/app/injection.dart';
import 'package:app/modules/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/modules/auth/data/models/auth_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

mixin AuthRepositoryMixin {
  AuthLocalDataSource get _authLocalDataSource => sl<AuthLocalDataSource>();

  Future<Either<CustomException, T>> executeWithCustomerId<T>(
    Future<T> Function(String customerId) operation,
  ) async {
    try {
      final user = await _authLocalDataSource.getUser();
      if (user?.customerId == null) {
        return Left(CustomException(message: 'Usuario no encontrado o customerId nulo'));
      }
      final result = await operation(user!.customerId);
      return Right(result);
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  Future<Either<CustomException, T>> executeWithCustomerIdAndSession<T>(
    Future<T> Function(String? customerId, String session) operation,
  ) async {
    try {
      final user = await _authLocalDataSource.getUser();
      final session = await _authLocalDataSource.getSession();
      final result = await operation(user?.customerId, session);
      return Right(result);
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  Future<Either<CustomException, T>> executeWithParamsInjection<T, P>(
    P params,
    Future<T> Function(P injectedParams) operation,
    P Function(P params, String customerId) injectCustomerId,
  ) async {
    try {
      final user = await _authLocalDataSource.getUser();
      if (user?.customerId == null) {
        return Left(CustomException(message: 'Usuario no encontrado o customerId nulo'));
      }
      final injectedParams = injectCustomerId(params, user!.customerId);
      final result = await operation(injectedParams);
      return Right(result);
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  Future<Either<CustomException, AuthModel>> getCurrentUser() async {
    try {
      final user = await _authLocalDataSource.getUser();
      if (user == null) {
        return Left(CustomException(message: 'Usuario no encontrado'));
      }
      return Right(user);
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  Future<bool> getCartMigratedStatus() async {
    return _authLocalDataSource.getCartMigratedToIam();
  }

  Future<void> setCartMigratedStatus() async {
    await _authLocalDataSource.setCartMigratedToIam();
  }

  Future<void> saveAuthSession(AuthModel user) async {
    await _authLocalDataSource.addUser(user);
    await _authLocalDataSource.addToken(user);
    await _authLocalDataSource.addRefreshToken(user);
    await _authLocalDataSource.getSession();
  }

  Future<AuthModel?> getLocalUser() async {
    return _authLocalDataSource.getUser();
  }

  Future<void> clearLocalSession() async {
    await _authLocalDataSource.logout();
  }
}
