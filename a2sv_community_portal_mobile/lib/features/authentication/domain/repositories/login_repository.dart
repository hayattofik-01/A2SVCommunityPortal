import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/login.dart';


abstract class LoginRepository {
  Future<Either<Failure, Login>> loginUser(String email, String password);
  Future<Either<Failure, Login>> fetchCachedToken();
}
