import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/login.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_local_datasource.dart';
import '../datasource/login_remote_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Login>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.loginUser(email, password);
        localDataSource.cacheToken(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(SERVER_FALIURE));
      }
    } else {
      return Left(NoConnectionFailure(NO_CONNECTION_ERROR));
    }
  }

  @override
  Future<Either<Failure, Login>> fetchCachedToken() async {
    try {
      final localData = await localDataSource.getLastToken();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure(CACHE_EXCEPTION));
    }
  }
}

