import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUser implements UseCase<UserEntity, String> {
  final UserRepository repository;
  GetUser(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(String id) async {
    return await repository.getUser(id);
  }
}
