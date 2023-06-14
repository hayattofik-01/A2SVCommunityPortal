import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/repositories/user_repository.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/edit_user_profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'edit_user_profile_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late EditUserProfile usecase;
  late MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = EditUserProfile(mockUserRepository);
  });

  const tUser = UserEntity(
      id: '123',
      name: 'Test User',
      email: 'test@test.com',
      telegramUsername: 'testuser',
      codeForces: 'testuser',
      password: 'password123');
  const tEditedUser = UserEntity(
      id: '123',
      name: 'Edited Test User',
      email: 'edited@test.com',
      telegramUsername: 'editedtestuser',
      codeForces: 'editedtestuser',
      password: 'password123');

  test(
    'should edit the user profile when the repository call is successful',
    () async {
      // arrange
      when(mockUserRepository.editUserProfile(any))
          .thenAnswer((_) async => const Right(tEditedUser));
      // act
      final result = await usecase(tUser);
      // assert
      expect(result, const Right(tEditedUser));
      verify(mockUserRepository.editUserProfile(tUser));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
  test(
    'should return a failure when the repository call is unsuccessful',
    () async {
      // arrange
      when(mockUserRepository.editUserProfile(any))
          .thenAnswer((_) async => const Left(ServerFailure(serverFaliure)));
      // act
      final result = await usecase(tUser);
      // assert
      expect(result, const Left(ServerFailure(serverFaliure)));
      verify(mockUserRepository.editUserProfile(tUser));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
