part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
final RegistrationPayload user;
  SignUpButtonPressed({required this.user});
}
