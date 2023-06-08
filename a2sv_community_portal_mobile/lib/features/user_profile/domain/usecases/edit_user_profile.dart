import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class EditUserProfile implements UseCase<UserEntity, UserEntity> {
  final UserRepository userRepository;

  EditUserProfile(this.userRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await userRepository.editUserProfile(user);
  }
}
