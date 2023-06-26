
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'login_state.dart';


part 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc({required this.loginUser}) : super(LoginInitial()) {
    on<LoginPressed>((event, emit) async {
      emit(LoginLoading());
      final loginParams = LoginParams(email: event.email, password: event.password);
     
      final loginEither = await loginUser(loginParams);
      loginEither.fold(
    
        (failure) => emit(LoginFailure(failure.message.toString())),
       
        (login) => emit(const LoginSuccessfull()),
      );
    });
  }
}

