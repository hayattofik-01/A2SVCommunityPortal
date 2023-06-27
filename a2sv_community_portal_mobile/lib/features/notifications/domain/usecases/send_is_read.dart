import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/repository/notification_repository.dart';
import 'package:dartz/dartz.dart';

class SendIsRead {
  final NotificationRepository repository;
  SendIsRead({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.sendIsRead();
  }
}
