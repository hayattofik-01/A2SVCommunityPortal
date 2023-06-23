import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/entities/announcement.dart';
import 'package:dartz/dartz.dart';

abstract class AnnouncementRemoteDataSource {
  Future<List<Announcement>> getAnnouncements();
}
