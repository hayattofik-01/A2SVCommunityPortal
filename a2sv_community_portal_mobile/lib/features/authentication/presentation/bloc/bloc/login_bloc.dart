import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/login.dart';
import 'login_state.dart';


part 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  LoginBloc({
    required this.loginUser
  }) : super(LoginInitial()) {
    on<LoginPressed>(submitForm);
   
  }
  LoginState loggingSuccessOrFailure(Either<Failure,Login> data){
     return data.fold((failure) =>LoginFailure( failure.toString(),),
        (success) =>const LoginSuccessfull());
  }
 void submitForm(LoginPressed event, Emitter<LoginState> emit) async {
   emit(LoginLoading());
    LoginParams login = LoginParams(email:event.email,password:event.password);
    final response = await loginUser(login);
    emit( loggingSuccessOrFailure(response));
  }
  }

