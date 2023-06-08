import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/login_repository.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'login_user_test.mocks.dart';
@GenerateMocks([LoginRepository])
void main() {
  late MockLoginRepository mockRepository;
  late LoginUser useCase;

  setUp(() {
    mockRepository = MockLoginRepository();
    useCase = LoginUser(repository: mockRepository);
  });

  test('should login user successfully', () async {
    final loginParams = LoginParams(email: 'email', password: 'password');
    final login = Login(token: 'token');

    when(useCase(loginParams)).thenAnswer((_) async => Right(login));

    final result = await useCase(loginParams);

    verify(mockRepository.loginUser(loginParams.email, loginParams.password));
    expect(result, Right(login));
  });

  test('should fail to login user', () async {
    final loginParams = LoginParams(email: 'email', password: 'password');
    final failure = InputFailure('Failed to login');

   when(useCase(loginParams)).thenAnswer((_) async => Left(failure));
    

    final result = await useCase(loginParams);

    verify(mockRepository.loginUser(loginParams.email, loginParams.password));
    expect(result, Left(failure));
  });
}