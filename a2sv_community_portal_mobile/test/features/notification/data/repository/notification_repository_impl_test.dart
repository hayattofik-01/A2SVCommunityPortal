import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/model/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'notification_repository_impl_test.mocks.dart';

@GenerateMocks([NotificationRemoteDataSource, NetworkInfo])
void main() {
  late NotificationRepositoryImpl repository;
  late MockNotificationRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockNotificationRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NotificationRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getNotifications', () {
    final tNotifications = [
      const NotificationModel(
        title: 'Test title 1',
        content: 'Test content 1',
        type: 'Test type 1',
        isRead: false,
      ),
      const NotificationModel(
        title: 'Test title 2',
        content: 'Test content 2',
        type: 'Test type 2',
        isRead: true,
      ),
    ];

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getNotifications())
          .thenAnswer((_) async => tNotifications);
      // act
      await repository.getNotifications();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNotifications())
            .thenAnswer((_) async => tNotifications);
        // act
        final result = await repository.getNotifications();
        // assert
        verify(mockRemoteDataSource.getNotifications());
        expect(result, equals(Right(tNotifications)));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNotifications())
            .thenThrow(ServerException(serverFaliure));
        // act
        final result = await repository.getNotifications();
        // assert
        verify(mockRemoteDataSource.getNotifications());
        expect(result, equals(const Left(ServerFailure(serverFaliure))));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return no connection failure', () async {
        // act
        final result = await repository.getNotifications();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(
            result, equals(const Left(NoConnectionFailure(noConnectionError))));
      });
    });
  });

  group('sendIsRead', () {
    test(
        'should return null when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.sendIsRead()).thenAnswer((_) async => null);
      // act
      final result = await repository.sendIsRead();
      // assert
      verify(mockRemoteDataSource.sendIsRead());
      expect(result, equals(const Right(null)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.sendIsRead())
          .thenThrow(ServerException(serverFaliure));
      // act
      final result = await repository.sendIsRead();
      // assert
      verify(mockRemoteDataSource.sendIsRead());
      expect(result, equals(const Left(ServerFailure(serverFaliure))));
    });
  });
}
