part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed({required this.email, required this.password});
  @override
  List<Object> get props => [password, email];
}