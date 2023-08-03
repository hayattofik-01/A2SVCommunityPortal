import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/auth_repository.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'login_user_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockRepository;
  late LoginUser useCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUser(repository: mockRepository);
  });

  test('should login user successfully', () async {
    const  loginParams = LoginParams(email: 'email', password: 'password');
    const  login = Login(token: 'token');

    when(useCase(loginParams)).thenAnswer((_) async => const Right(login));

    final result = await useCase(loginParams);

    verify(mockRepository.loginUser(loginParams.email, loginParams.password));
    expect(result, const Right(login));
  });

  test('should fail to login user', () async {
    const  loginParams = LoginParams(email: 'email', password: 'password');
    const  failure = InputFailure('Failed to login');

   when(useCase(loginParams)).thenAnswer((_) async => const Left(failure));
    

    final result = await useCase(loginParams);

    verify(mockRepository.loginUser(loginParams.email, loginParams.password));
    expect(result, const Left(failure));
  });
}
