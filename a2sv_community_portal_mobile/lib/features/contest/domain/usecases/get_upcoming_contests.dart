import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/repository/contest_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class GetUpcomingContests {
  final ContestRepository repository;
  GetUpcomingContests({required this.repository});


  Future<Either<Failure, List<Contest>>> call() async {
    return await repository.getUpcomingContests();
  }
}