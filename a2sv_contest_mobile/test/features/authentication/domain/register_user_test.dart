import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/auth_repository.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/reigster_user.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'login_user_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockRepository;
  late RegisterUser useCase;
  late RegistrationPayload user;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = RegisterUser(repository: mockRepository);
  user = const RegistrationPayload(fullName: "jhon",
     email: "j@gmail.com", phoneNumber: "1234455666", codeforces: "cfs", telegram: "tg", 
     password: "11245675745", confirmPassword: "11245675745");
  });

  test('should register user successfully', () async {
    
    const  login = Login(token: 'token');

    when(useCase(user)).thenAnswer((_) async => const Right(login));

    final result = await useCase(user);

    verify(mockRepository.register(user));
    expect(result, const Right(login));
  });

  test('should fail to login user', () async {
    
    const  failure = InputFailure('Failed to login');

   when(useCase(user)).thenAnswer((_) async => const Left(failure));
    

    final result = await useCase(user);

    verify(mockRepository.register(user));
    expect(result, const Left(failure));
  });
}
