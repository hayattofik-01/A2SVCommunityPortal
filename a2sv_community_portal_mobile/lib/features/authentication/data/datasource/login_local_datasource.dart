import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/login.dart';
import '../model/login_model.dart';

abstract class LoginLocalDataSource {
  Future<Login> getLastToken();
  Future<void> cacheToken(Login login);
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheToken(Login login) {
    return sharedPreferences.setString(CACHED_TOKEN, jsonEncode(login));
  }

  @override
  Future<LoginModel> getLastToken() {
    String? jsonStr = sharedPreferences.getString(CACHED_TOKEN);
    if (jsonStr == null) {
      throw CacheException(CACHE_EXCEPTION);
    }
    return Future.value(LoginModel.fromJson(jsonDecode(jsonStr)));
  }
}