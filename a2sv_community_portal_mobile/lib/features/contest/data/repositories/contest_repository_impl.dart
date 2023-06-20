import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/datasources/contest_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/repository/contest_repository.dart';
import 'package:dartz/dartz.dart';

class ContestRepositoryImpl implements ContestRepository {
  final ContestRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ContestRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Contest>>> getContests() async {
    if (await networkInfo.isConnected) {
      try {
        final contests = await remoteDataSource.getContests();
        return Right(contests);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      return Left(NoConnectionFailure(noConnectionError));
    }
  }

  @override
  Future<Either<Failure, List<Contest>>> getPastContests() {
    // TODO: implement getPastContests
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Contest>>> getUpcomingContests() {
    // TODO: implement getUpcomingContests
    throw UnimplementedError();
  }
}
