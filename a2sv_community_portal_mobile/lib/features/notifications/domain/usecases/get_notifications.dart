import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/repository/notification_repository.dart';
import 'package:dartz/dartz.dart';

class GetNotification {
  final NotificationRepository repository;
  GetNotification({required this.repository});

  Future<Either<Failure, List<Notification>>> call() async {
    return await repository.getNotifications();
  }
}
