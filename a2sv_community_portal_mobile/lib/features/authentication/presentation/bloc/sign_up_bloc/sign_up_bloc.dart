import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/reigster_user.dart';
import 'package:bloc/bloc.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RegisterUser registerUser;

  SignUpBloc({required this.registerUser}) : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      emit(SignUpLoading());
     
      final signUpEither = await registerUser(event.user);
     

      signUpEither.fold(
        (failure) => emit(SignUpFailure(error: failure.message.toString())),
        (login) => emit(SignUpSuccess()),
      );
    });
  }
}
