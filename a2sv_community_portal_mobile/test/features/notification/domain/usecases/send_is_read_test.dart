import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/repository/notification_repository.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/usecases/send_is_read.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notifications_test.mocks.dart';

@GenerateMocks([NotificationRepository])
void main() {
  late SendIsRead usecase;
  late MockNotificationRepository mockRepository;

  setUp(() {
    mockRepository = MockNotificationRepository();
    usecase = SendIsRead(repository: mockRepository);
  });

  group('SendIsRead', () {
    test('should return null from the repository', () async {
      // Arrange
      when(mockRepository.sendIsRead())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(const Right(null)));
      verify(mockRepository.sendIsRead());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when repository returns a failure', () async {
      // Arrange
      when(mockRepository.sendIsRead())
          .thenAnswer((_) async => const Left(ServerFailure(serverFaliure)));

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(const Left(ServerFailure(serverFaliure))));
      verify(mockRepository.sendIsRead());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
