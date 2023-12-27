
import 'dart:convert';
import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_local_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/model/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  late SharedPreferences sharedPreferences;
  late LoginLocalDataSourceImpl dataSource;

  setUp(() async {
    sharedPreferences = await SharedPreferences.getInstance();
    dataSource = LoginLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });

  test('cacheToken should save the login token to shared preferences', () async {
    // Arrange
    LoginModel loginModel = const LoginModel(token: 'test');

    // Act
    await dataSource.cacheToken(loginModel);

    // Assert
    String ?jsonStr = sharedPreferences.getString(cachedToken);
    expect(jsonStr, isNotNull);
    LoginModel restoredLoginModel = LoginModel.fromJson(jsonDecode(jsonStr!));
    expect(restoredLoginModel, loginModel);
  });

  test('getLastToken should return the cached login token', () async {
    // Arrange
    LoginModel loginModel = const LoginModel(token: 'token');
    sharedPreferences.setString(cachedToken, jsonEncode(loginModel));

    // Act
    LoginModel? token = await dataSource.getLastToken();

    // Assert
    expect(token, isNotNull);
    expect(token, loginModel);
  });

  test('getLastToken should throw an exception if no token is cached', () async {
    // Arrange
    sharedPreferences.remove(cachedToken);

    // Act
    try {
      await dataSource.getLastToken();
    } catch (e) {
      // Assert
      expect(e, isA<CacheException>());
    }
  });
}