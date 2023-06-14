import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> editUserProfile(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.editUserProfile(user);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      return const Left(CacheFailure(cacheException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      try {
        final localUser = await localDataSource.getUser();
        return Right(localUser);
      } on CacheException {
        return const Left(CacheFailure(cacheException));
      }
    }
  }
}
