import 'package:a2sv_community_portal_mobile/features/user_profile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/login.dart';


abstract class AuthRepository {
  Future<Either<Failure, Login>> loginUser(String email, String password);
  Future<Either<Failure, Login>> fetchCachedToken();
   Future<Either<Failure, Login>> register(UserModel user);

}
