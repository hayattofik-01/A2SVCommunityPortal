import 'package:a2sv_community_portal_mobile/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


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

