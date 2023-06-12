import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/repositories/user_repository.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/get_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'edit_user_profile_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetUser usecase;
  late MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetUser(mockUserRepository);
  });
  const String id = '123';
  const tUser = UserEntity(
      id: '123',
      name: 'Test User',
      email: 'test@test.com',
      telegramUsername: 'testuser',
      codeForces: 'testuser',
      password: 'password123');

  test(
    'should edit the user profile when the repository call is successful',
    () async {
      // arrange
      when(mockUserRepository.getUser(id))
          .thenAnswer((_) async => const Right(tUser));
      // act
      final result = await usecase(id);
      // assert
      expect(result, const Right(tUser));
      verify(mockUserRepository.getUser(id));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
  test(
    'should return a failure when the repository call is unsuccessful',
    () async {
      // arrange
      when(mockUserRepository.getUser(id))
          .thenAnswer((_) async => const Left(ServerFailure("Server Failure")));
      // act
      final result = await usecase(id);
      // assert
      expect(result, const Left(ServerFailure("Server Failure")));
      verify(mockUserRepository.getUser(id));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
