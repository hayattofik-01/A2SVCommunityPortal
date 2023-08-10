
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessful extends LoginState {

  const LoginSuccessful();
}

class LoginFailure extends LoginState {
  final String  exception;

  const LoginFailure(this.exception);
}