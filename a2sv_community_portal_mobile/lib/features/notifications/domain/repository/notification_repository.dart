import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();
   Future<Either<Failure, void>> sendIsRead();
}
