import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/announcement.dart';
import '../repository/announcement_repository.dart';

class GetAnnouncements {
  final AnnouncementRepository repository;
  GetAnnouncements({required this.repository});

  Future<Either<Failure, List<Announcements>>> getAnnouncements() async {
    return await repository.getAnnouncements();
  }
}
