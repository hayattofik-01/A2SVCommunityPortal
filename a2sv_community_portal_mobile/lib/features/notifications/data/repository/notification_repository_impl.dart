import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/repository/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Notification>>> getNotifications() async {
    if (await networkInfo.isConnected) {
      try {
        final notifications = await remoteDataSource.getNotifications();
        return Right(notifications);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      return const Left(NoConnectionFailure(noConnectionError));
    }
  }

  @override
  Future<Either<Failure, void>> sendIsRead() async {
    try {
      await remoteDataSource.sendIsRead();
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure(serverFaliure));
    }
  }
}
