import 'package:app/modules/auth/data/models/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<void> addUser(AuthModel authModel);
  Future<void> addToken(AuthModel authModel);
  Future<void> addRefreshToken(AuthModel authModel);
  Future<AuthModel?> getUser();
  Future<String> getSession();
  Future<bool> setSession(String session);
  Future<void> logout();
  Future<String> decodeToken();
  Future<bool> getCartMigratedToIam();
  Future<void> setCartMigratedToIam();
}
