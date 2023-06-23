import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class EditUserProfile implements UseCase<UserEntity, UserEntity> {
  final UserRepository repository;

  EditUserProfile({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.editUserProfile(user);
  }
}
