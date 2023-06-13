import 'dart:convert';
import 'dart:developer';
import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_local_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/model/login_model.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/repository/login_repo_impl.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../repository/login_repo_impl_test.mocks.dart';
import 'package:http/http.dart' as http;

import 'login_remote_datasource_test.mocks.dart';

@GenerateMocks([
  http.Client,
])
void main() {
  late MockClient mockHttpClient;
  late LoginRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockHttpClient = MockClient();
    dataSourceImpl = LoginRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('loginUser', () {
    final String tEmail = 'test@test.com';
    final String tPassword = 'test';
    final LoginModel tLoginModel = LoginModel(token: '1234');

    test('should return the User object if the status code is 200',
        () async {
      //arrange
      when(mockHttpClient.post(any,body:jsonEncode({
        'email': tEmail,
        'password': tPassword,
      }))).thenAnswer(
          (_) async => http.Response(fixture('user_login.json'), 200));
      //act
      final result = await dataSourceImpl.loginUser(tEmail, tPassword);

      //assert
      verify(mockHttpClient.post(any,body:jsonEncode({
        'email': tEmail,
        'password': tPassword,
      })));
      expect(result, equals(tLoginModel));
    });
test('should throw Login Failed Excepteion  if the status code is 401', () async {
      //arrange
       when(mockHttpClient.post(any,body:jsonEncode({
        'email': tEmail,
        'password': tPassword,
      }))).thenAnswer(
          (_) async => http.Response(fixture('user_login_null_token.json'), 401));

      //act
      final call = dataSourceImpl.loginUser;

      //assert
      expect(() => call(tEmail, tPassword), throwsA(isA<LoginFailedException>()));
    });

    test('should throw an exception if the status code is not 200', () async {
      //arrange
       when(mockHttpClient.post(any,body:jsonEncode({
        'email': tEmail,
        'password': tPassword,
      }))).thenAnswer(
          (_) async => http.Response(fixture('user_login_null_token.json'), 500));

      //act
      final call = dataSourceImpl.loginUser;

      //assert
      expect(() => call(tEmail, tPassword), throwsA(isA<ServerException>()));
    });
  });
}