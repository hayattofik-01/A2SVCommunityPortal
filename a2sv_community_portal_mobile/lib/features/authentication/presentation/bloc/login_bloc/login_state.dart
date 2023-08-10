
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessfull extends LoginState {

  const LoginSuccessfull();
}

class LoginFailure extends LoginState {
  final String  exception;

  const LoginFailure(this.exception);
}