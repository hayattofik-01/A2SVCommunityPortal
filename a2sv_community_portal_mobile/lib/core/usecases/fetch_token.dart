import 'package:dartz/dartz.dart';


import '../../features/authentication/domain/entities/login.dart';
import '../../features/authentication/domain/repositories/login_repository.dart';
import '../errors/failures.dart';


class FetchTokenUseCase {
  final LoginRepository repository;

  FetchTokenUseCase({required this.repository});

  Future<Either<Failure, Login>> call() async {

    return repository.fetchCachedToken();
    
    }
  }

