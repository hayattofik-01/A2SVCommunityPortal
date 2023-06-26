import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';

import 'package:dartz/dartz.dart';


import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login.dart';
import '../repositories/auth_repository.dart';

class RegisterUser implements UseCase<Login, RegistrationPayload> {
  final AuthRepository repository;

  RegisterUser({required this.repository});

  @override
  Future<Either<Failure, Login>> call(RegistrationPayload user) async {
    return await repository.register(
     user);
  }
}

