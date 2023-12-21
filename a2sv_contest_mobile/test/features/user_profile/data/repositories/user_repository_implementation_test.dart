import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/datasources/user_local_data_source.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/datasources/user_remote_data_source.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/models/user_model.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/repositories/user_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_implementation_test.mocks.dart';

@GenerateMocks([UserRemoteDataSource, UserLocalDataSource, NetworkInfo])
void main() {
  late UserRepositoryImpl repository;
  late MockUserRemoteDataSource mockRemoteDataSource;
  late MockUserLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    mockLocalDataSource = MockUserLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UserRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const tUserModel = UserModel(
    fullName: 'John Doe',
    email: 'john.doe@example.com',
    telegramUsername: 'johndoe',
    codeforcesHandle: 'johndoe',
    phoneNumber: '12345'

  );

  group('editUserProfile', () {
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.editUserProfile(tUserModel))
          .thenAnswer((_) async => tUserModel);
      await repository.editUserProfile(tUserModel);
      verify(mockRemoteDataSource.editUserProfile(tUserModel)).called(1);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.editUserProfile(tUserModel))
              .thenAnswer((_) async => tUserModel);
          final result = await repository.editUserProfile(tUserModel);
          verify(mockRemoteDataSource.editUserProfile(tUserModel));
          expect(result, equals(const Right(tUserModel)));
        },
      );
      test(
        'should cache the data locally when the call to remote data is successful',
        () async {
          when(mockRemoteDataSource.editUserProfile(tUserModel))
              .thenAnswer((_) async => tUserModel);
          await repository.editUserProfile(tUserModel);
          verify(mockRemoteDataSource.editUserProfile(tUserModel));
          verify(mockLocalDataSource.cacheUser(tUserModel));
        },
      );
      test(
        'should return Server Failure if the call for the remote is not successful',
        () async {
          when(mockRemoteDataSource.editUserProfile(tUserModel))
              .thenThrow(ServerException(serverFaliure));

          final result = await repository.editUserProfile(tUserModel);
          verify(mockRemoteDataSource.editUserProfile(tUserModel));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure(serverFaliure))));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test(
        'it should return cahceFailure when the device is offline',
        () async {
          final result = await repository.editUserProfile(tUserModel);
          verifyZeroInteractions(mockRemoteDataSource);
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(CacheFailure(cacheException))));
        },
      );
    });
  });

  group('getUser', () {
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getUser()).thenAnswer((_) async => tUserModel);
      await repository.getUser();
      verify(mockRemoteDataSource.getUser()).called(1);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getUser())
              .thenAnswer((_) async => tUserModel);
          final result = await repository.getUser();
          verify(mockRemoteDataSource.getUser());
          expect(result, equals(const Right(tUserModel)));
        },
      );
      test(
        'should cache the data locally when the call to remote data is successful',
        () async {
          when(mockRemoteDataSource.getUser())
              .thenAnswer((_) async => tUserModel);
          await repository.getUser();
          verify(mockRemoteDataSource.getUser());
          verify(mockLocalDataSource.cacheUser(tUserModel));
        },
      );

      test(
        'should retufn server Failure when the call to the remove data is not successful',
        () async {
          when(mockRemoteDataSource.getUser())
              .thenThrow(ServerException(serverFaliure));

          final result = await repository.getUser();
          verify(mockRemoteDataSource.getUser());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure(serverFaliure))));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          when(mockLocalDataSource.getUser())
              .thenAnswer((_) async => tUserModel);
          final result = await repository.getUser();
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getUser());
          expect(result, equals(const Right(tUserModel)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(mockLocalDataSource.getUser())
              .thenThrow(CacheException(cacheException));
          final result = await repository.getUser();
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getUser());
          expect(result, equals(const Left(CacheFailure(cacheException))));
        },
      );
    });
  });
}
