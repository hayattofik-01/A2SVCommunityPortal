import 'package:a2sv_community_portal_mobile/features/user_profile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login.dart';
import '../repositories/auth_repository.dart';

class RegisterUser implements UseCase<Login, UserModel> {
  final AuthRepository repository;

  RegisterUser({required this.repository});

  @override
  Future<Either<Failure, Login>> call(UserModel user) async {
    return await repository.register(user);
  }
}
