import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginUser(String email, String password);
  Future<Either<Failure, Login>> fetchCachedToken();
  Future<Either<Failure, Login>> register(
  RegistrationPayload user
  );
}
