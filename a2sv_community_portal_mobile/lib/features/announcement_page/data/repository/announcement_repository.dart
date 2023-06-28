import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/entities/announcement.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/repository/announcement_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repository/announcement_datasource.dart';

class AnnouncementRepositoryImplementation implements AnnouncementRepository {
  final AnnouncementRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AnnouncementRepositoryImplementation({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Announcement>>> getAnnouncements() async {
    if (await networkInfo.isConnected) {
      final announcements = await remoteDataSource.getAnnouncements();
      return Right(announcements);
    } else {
      return const Left(NoConnectionFailure(noConnectionError));
    }
  }
}
