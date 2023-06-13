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
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'login_repo_impl_test.mocks.dart';

@GenerateMocks([LoginRemoteDataSource, NetworkInfo, LoginLocalDataSource])
void main() {
  final String tEmail = "test@test.com";
  final String tPassword = "test";
  final LoginModel tLoginModel = LoginModel(token: "1234");
  final Login tLogin = tLoginModel;
  late LoginRepositoryImpl repository;
    late MockLoginRemoteDataSource mockRemoteDataSource;
    late MockLoginLocalDataSource mockLocalDataSource;
    late MockNetworkInfo mockNetworkInfo;
  setUp(() {
  

    mockRemoteDataSource = MockLoginRemoteDataSource();
    mockLocalDataSource = MockLoginLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = LoginRepositoryImpl(
      networkInfo: mockNetworkInfo,
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group("get user token", () {
    
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
       when(mockRemoteDataSource.loginUser(tEmail, tPassword))
          .thenAnswer((_) async => tLoginModel);
      //act
      repository.loginUser(tEmail, tPassword);

      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group("device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should return the token when the remote call is successfull',
        () async {
      //arrange
      when(mockRemoteDataSource.loginUser(tEmail, tPassword))
          .thenAnswer((_) async => tLoginModel);

      //act
      final result = await repository.loginUser(tEmail, tPassword);

      //assert
      verify(mockRemoteDataSource.loginUser(tEmail, tPassword));
      expect(result, equals(Right(tLogin)));
    });

    test('should cache the token locally when the remote call is successfull',
        () async {
      //arrange
      when(mockRemoteDataSource.loginUser(tEmail, tPassword))
          .thenAnswer((_) async => tLoginModel);

      //act
      await repository.loginUser(tEmail, tPassword);

      //assert
      verify(mockRemoteDataSource.loginUser(tEmail, tPassword));
      verify(mockLocalDataSource.cacheToken(tLoginModel));
    });

    test('should return a failure when the remote call is unsuccessfull',
        () async {
      //arrange
      when(mockRemoteDataSource.loginUser(tEmail, tPassword))
          .thenThrow(ServerException(SERVER_FALIURE));

      //act
      final result = await repository.loginUser(tEmail, tPassword);

      //assert
      verify(mockRemoteDataSource.loginUser(tEmail, tPassword));
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(Left(ServerFailure(SERVER_FALIURE))));
    });
  });

  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('should return a NoConnectionFailure if the device is offline',
        () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      //act
      final result = await repository.loginUser(tEmail, tPassword);

      //assert
      verifyZeroInteractions(mockRemoteDataSource);
      expect(result, equals(Left(NoConnectionFailure(NO_CONNECTION_ERROR))));
    });
  });
}