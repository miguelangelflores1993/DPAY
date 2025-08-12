import 'dart:convert';

import 'package:app/modules/auth/data/models/auth_model.dart';
import 'package:networking_flutter_dio/core/local/key_value_storage_base.dart';
import 'package:networking_flutter_dio/core/local/variables.dart';
import 'package:uuid/uuid.dart';

class KeyValueStorageService {
  String get authTokenKey => GlobalVariables.authTokenKey;
  String get authTokenRefreshKey => GlobalVariables.authTokenRefreshKey;
  String get authUserKey => GlobalVariables.authUserKey;
  String get authSessionKey => GlobalVariables.authSessionKey;
  final KeyValueStorageBase _keyValueStorage = KeyValueStorageBase();

  Future<void> setAuthToken(String token) async {
    await _keyValueStorage.setEncrypted(GlobalVariables.authTokenKey, token);
  }

  Future<void> getAuthToken(String token) async {
    await _keyValueStorage.getEncrypted(GlobalVariables.authTokenKey);
  }

  Future<void> setAuthTokenRefresh(String token) async {
    await _keyValueStorage.setEncrypted(
      GlobalVariables.authTokenRefreshKey,
      token,
    );
  }

  static const String _cartMigratedKey = 'cart_migrated_to_iam';

  Future<bool> getCartMigratedToIam() async {
    return _keyValueStorage.getCommon(_cartMigratedKey) ?? false;
  }

  Future<void> setCartMigratedToIam() async {
    await _keyValueStorage.setCommon(_cartMigratedKey, true);
  }

  Future<void> getAuthTokenRefresh(String token) async {
    await _keyValueStorage.getEncrypted(GlobalVariables.authTokenRefreshKey);
  }

  Future<AuthModel?> getAuth() async {
    final auth = await _keyValueStorage.getEncrypted(
      GlobalVariables.authUserKey,
    );
    if (auth != null) {
      final dataParse = jsonDecode(auth) as Map<String, dynamic>;
      return AuthModel.fromJson(dataParse);
    } else {
      return null;
    }
  }

  Future<String?> getSession() async {
    return _keyValueStorage.getEncrypted(GlobalVariables.authSessionKey);
  }

  Future<bool> setSession(String session) async {
    return _keyValueStorage.setEncrypted(
      GlobalVariables.authSessionKey,
      session,
    );
  }

  Future<String> getOrCreateSession() async {
    final existing = await getSession();
    if (existing != null) return existing;

    final newSession = const Uuid().v4();
    await setSession(newSession);
    return newSession;
  }

  Future<void> setAuth(AuthModel auth) async {
    final authJson = jsonEncode(auth.toJson());
    await _keyValueStorage.setEncrypted(GlobalVariables.authUserKey, authJson);
  }

  Future<void> logout() async {
    await _keyValueStorage.clearCommon();
    await _keyValueStorage.clearEncrypted();
  }
}
