// import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
// import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
// import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/auth_repository.dart';
// import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/reigster_user.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'register_user_test.mocks.dart';

// @GenerateMocks([AuthRepository])
// void main() {
//   late RegisterUser usecase;
//   late MockAuthRepository mockUserRepository;

//   setUp(() {
//     mockUserRepository = MockAuthRepository();
//     usecase = RegisterUser(repository:mockUserRepository);
//   });

// const  tLogin = Login(
//       token:'1234');

//   test("Should Create the user with the given data and return the created user",
//       () async {
//     when(mockUserRepository.register(tUser))
//         .thenAnswer((_) async => const Right(tLogin));

//     final result = await usecase(tUser);
//     expect(result, Right(tUser));
//     verify(mockUserRepository.createUser(tUser));
//     verifyNoMoreInteractions(mockUserRepository);
//   });

//   test("Should return Server failure when user is not create", () async {
//     when(mockUserRepository.createUser(tUser))
//         .thenAnswer((_) async => Left(ServerFailure("Internal Server Error")));

//     final result = await usecase(tUser);
//     expect(result, Left(ServerFailure("Internal Server Error")));
//     verify(mockUserRepository.createUser(tUser));
//     verifyNoMoreInteractions(mockUserRepository);
//   });

//   test(
//       "Should return an input failure when it fails to create user profile due to input mismatch",
//       () async {
//     when(mockUserRepository.createUser(tUser))
//         .thenAnswer((_) async => Left(InputFailure("Input Mismatch")));

//     final result = await usecase(tUser);
//     expect(result, Left(InputFailure("Input Mismatch")));
//     verify(mockUserRepository.createUser(tUser));
//     verifyNoMoreInteractions(mockUserRepository);
//   });
// }
