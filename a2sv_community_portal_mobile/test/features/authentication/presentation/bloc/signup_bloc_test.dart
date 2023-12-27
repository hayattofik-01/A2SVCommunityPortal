import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/reigster_user.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'signup_bloc_test.mocks.dart';


@GenerateMocks([RegisterUser])

void main() {
late MockRegisterUser mockRegisterUser;
 late  SignUpBloc signUpBloc;
 late Login tLogin;
 late RegistrationPayload  user;
setUp(() {
    mockRegisterUser = MockRegisterUser();
    signUpBloc = SignUpBloc(registerUser: mockRegisterUser);
   tLogin = Login(token: '1234');
   user  = RegistrationPayload(fullName: '', email: '', phoneNumber: '', codeforces: '', telegram: '', password: '', confirmPassword: '');
  });

  tearDown(() {
    signUpBloc.close();
  });

  test('initial state should be signUpInitial', () {
    
    expect(signUpBloc.state, equals(SignUpInitial()));
  });

  blocTest<SignUpBloc, SignUpState>(
    'emits [signUpLoading,signUpSuccessful] when signUpPressed is added',
    
    build: () => signUpBloc,
    act: (bloc) async {
        when(mockRegisterUser(any))
            .thenAnswer((_) async =>  Right(tLogin));

        bloc.add(SignUpButtonPressed(user:user ));
        await expectLater(
          bloc.stream,
          emitsInOrder([
           SignUpLoading(),
           SignUpSuccess(),
            ])
        );
        verify(mockRegisterUser(any));
      },
      expect: () => [
      SignUpLoading(),
        SignUpSuccess(),
       
      ],
   
  );

  blocTest<SignUpBloc, SignUpState>(
    'emits [signUpLoading, signUpFailure] when signUpButtonPressed is added with invalid credentials',
     build: () =>signUpBloc,
   act: (bloc) async {
        when(mockRegisterUser(any)).thenAnswer(
            (_) async => const Left(ServerFailure('signup Failed')));

        bloc.add( SignUpButtonPressed(user: user));
        await expectLater(
          bloc.stream,
          emitsInOrder([
            SignUpLoading(),
             SignUpFailure(error: 'signup Failed'),
            
          ]),
        );
        verify(mockRegisterUser(any));
      },
      expect: () => [
       SignUpLoading(),
        
        SignUpFailure(error: 'signup Failed'),
        
      ],
  );
}