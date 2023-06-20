

// class LoginState{
//   final String  email;
//   final String password;
//   final FormSubmissionStatus formStatus;

//  LoginState({
//     this.email = '',
//     this.password = '',
//     this.formStatus = const  InitialFormStatus() ,
//   });

//   LoginState copyWith({
//    String ?email,
//      String ?password,  formStatus,
//   }){
//     return LoginState( email: email ?? this.email,
//     password: password ?? this.password

//     );

//   }
// }
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
  final String exception;

  const LoginFailure(this.exception);
}