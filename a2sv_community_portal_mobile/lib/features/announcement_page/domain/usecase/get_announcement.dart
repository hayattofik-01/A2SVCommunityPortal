import 'package:a2sv_community_portal_mobile/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/announcement.dart';
import '../repository/announcement_repository.dart';

class GetAnnouncements implements UseCase<List<Announcement>, NoParams>{
  final AnnouncementRepository repository;
  GetAnnouncements({required this.repository});

  @override
  Future<Either<Failure, List<Announcement>>> call(
      NoParams params) async {
    return await repository.getAnnouncements();
  }
}
