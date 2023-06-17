import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login.dart';
import '../repositories/login_repository.dart';

class LoginUser implements UseCase<Login, LoginParams> {
  final LoginRepository repository;

  LoginUser({required this.repository});

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return await repository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password}) : super();

  @override
  List<Object?> get props => [email, password];
}