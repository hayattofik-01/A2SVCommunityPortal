import 'package:dartz/dartz.dart';
import '../entities/contest.dart';
import '../../../../core/errors/failures.dart';

abstract class ContestRepository {

  Future<Either<Failure,List<Contest>>> getUpcomingContests();
  Future<Either<Failure,List<Contest>>> getPastContests();
}
