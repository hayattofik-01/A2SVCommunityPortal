import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/repository/notification_repository.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/usecases/get_notifications.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notifications_test.mocks.dart';

@GenerateMocks([NotificationRepository])
void main() {
  late GetNotification usecase;
  late MockNotificationRepository mockRepository;
  late List<Notification> notifications;

  setUp(() {
    mockRepository = MockNotificationRepository();
    usecase = GetNotification(repository: mockRepository);
    notifications = [
      const Notification(
        title: 'Test Notification 1',
        content: 'This is a test notification 1.',
        type: 'test',
        isRead: false,
      ),
      const Notification(
        title: 'Test Notification 2',
        content: 'This is a test notification 2.',
        type: 'test',
        isRead: true,
      ),
    ];
  });

  group('GetNotification', () {
    test('should return a list of notifications from the repository', () async {
      // Arrange
      when(mockRepository.getNotifications())
          .thenAnswer((_) async => Right(notifications));

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(Right(notifications)));
      verify(mockRepository.getNotifications());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when repository returns a failure', () async {
      // Arrange
      when(mockRepository.getNotifications())
          .thenAnswer((_) async => const Left(ServerFailure(serverFaliure)));

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(const Left(ServerFailure(serverFaliure))));
      verify(mockRepository.getNotifications());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
