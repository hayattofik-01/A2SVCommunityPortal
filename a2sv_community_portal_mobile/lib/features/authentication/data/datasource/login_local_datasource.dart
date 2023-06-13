import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
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
    return sharedPreferences.setString(cachedToken, jsonEncode(login));
  }

  @override
  Future<LoginModel> getLastToken() {
    String? jsonStr = sharedPreferences.getString(cachedToken);
    if (jsonStr == null) {
      throw CacheException(cacheException);
    }
    return Future.value(LoginModel.fromJson(jsonDecode(jsonStr)));
  }
}