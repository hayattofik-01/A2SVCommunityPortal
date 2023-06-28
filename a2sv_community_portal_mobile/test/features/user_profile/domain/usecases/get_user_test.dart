import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/usecases/usecase.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
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
    usecase = GetUser(repository: mockUserRepository);
  });
  const tUser = UserEntity(
      fullName: 'Test User',
      email: 'test@test.com',
      telegramUsername: 'testuser',
      codeforcesHandle: 'testuser',
      phoneNumber: '12345'
    );

  test(
    'should get the user profile when the repository call is successful',
    () async {
      // arrange
      when(mockUserRepository.getUser())
          .thenAnswer((_) async => const Right(tUser));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Right(tUser));
      verify(mockUserRepository.getUser());
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
  test(
    'should return a failure when the repository call is unsuccessful',
    () async {
      // arrange
      when(mockUserRepository.getUser())
          .thenAnswer((_) async => const Left(ServerFailure(serverFaliure)));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Left(ServerFailure(serverFaliure)));
      verify(mockUserRepository.getUser());
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
