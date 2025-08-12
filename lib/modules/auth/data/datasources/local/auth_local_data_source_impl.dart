import 'package:app/core/local/key_value_storage_service.dart';
import 'package:app/modules/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/modules/auth/data/models/auth_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl({required this.api});

  final KeyValueStorageService api;

  @override
  Future<AuthModel?> getUser() async {
    final auth = await api.getAuth();
    return auth;
  }

  @override
  Future<String> getSession() async {
    final session = await api.getOrCreateSession();
    return session;
  }

  @override
  Future<bool> setSession(String session) async {
    return api.setSession(session);
  }

  @override
  Future<void> logout() async {
    await api.logout();
  }

  @override
  Future<void> addUser(AuthModel authModel) async {
    final token = JwtDecoder.decode(authModel.accessToken);
    await api.setAuth(authModel.copyWith(customerId: token['IamId'] as String));
  }

  @override
  Future<void> addToken(AuthModel authModel) async {
    await api.setAuthToken(authModel.accessToken);
  }

  @override
  Future<void> addRefreshToken(AuthModel authModel) async {
    await api.setAuthTokenRefresh(authModel.refreshToken);
  }

  @override
  Future<bool> getCartMigratedToIam() async {
    return api.getCartMigratedToIam();
  }

  @override
  Future<void> setCartMigratedToIam() async {
    await api.setCartMigratedToIam();
  }

  @override
  Future<String> decodeToken() async {
    final auth = await api.getAuth();
    if (auth == null) {
      throw Exception('No token found');
    }
    final decodedToken = JwtDecoder.decode(auth.accessToken);
    return decodedToken['IamId'] as String;
  }
}
