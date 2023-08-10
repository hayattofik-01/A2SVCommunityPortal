import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/bloc/login_bloc/login_state.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([LoginUser])

void main() {
late MockLoginUser mockLoginUser;
 late  LoginBloc loginBloc;
 late Login tLogin;
setUp(() {
    mockLoginUser = MockLoginUser();
    loginBloc = LoginBloc(loginUser: mockLoginUser);
   tLogin = Login(token: '1234');
  });

  tearDown(() {
    loginBloc.close();
  });

  test('initial state should be LoginInitial', () {
    expect(loginBloc.state, equals(LoginInitial()));
  });

  blocTest<LoginBloc, LoginState>(
    'emits [LoginLoading, LoginSuccessful] when LoginPressed is added',
    build: () => loginBloc,
    act: (bloc) async {
        when(mockLoginUser(any))
            .thenAnswer((_) async =>  Right(tLogin));

        bloc.add(LoginPressed(email: '', password:''));
        await expectLater(
          bloc.stream,
          emitsInOrder([
           LoginLoading(),
            const LoginSuccessfull(),
            ])
        );
        verify(mockLoginUser(any));
      },
      expect: () => [
        LoginLoading(),
        const LoginSuccessfull(),
       
      ],
   
  );

  blocTest<LoginBloc, LoginState>(
    'emits [LoginLoading, LoginFailure] when LoginPressed is added with invalid credentials',
     build: () => loginBloc,
   act: (bloc) async {
        when(mockLoginUser(any)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        bloc.add( LoginPressed(email: '',password: ''));
        await expectLater(
          bloc.stream,
          emitsInOrder([
            LoginLoading(),
             const LoginFailure("login failed"),
            
          ]),
        );
        verify(mockLoginUser(any));
      },
      expect: () => [
       LoginLoading(),
        
        LoginFailure("login Failed"),
        
      ],
  );
}