// Import the necessary packages
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/edit_user_profile.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/get_user.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/bloc/profile_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_bloc_test.mocks.dart';

@GenerateMocks([GetUser, EditUserProfile])
void main() {
  late ProfileBloc profileBloc;
  late MockGetUser mockGetUser;
  late MockEditUserProfile mockEditUserProfile;

  setUp(() {
    mockGetUser = MockGetUser();
    mockEditUserProfile = MockEditUserProfile();
    profileBloc =
        ProfileBloc(editUserProfile: mockEditUserProfile, getUser: mockGetUser);
  });

  tearDown(() {
    profileBloc.close();
  });

  const tUser = UserEntity(
    fullName: "Test User",
    email: "test@test.com",
    telegramUsername: "test",
    codeforcesHandle: "test",
    phoneNumber: "1234567890",
  );

  group('Profile Loading', () {
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoadingState, ProfileLoadedState] when GetProfileEvent is added",
      build: () => profileBloc,
      act: (bloc) async {
        when(mockGetUser(any)).thenAnswer((_) async => const Right(tUser));

        bloc.add(const GetProfileEvent());
        await expectLater(
          profileBloc.stream,
          emitsInOrder([
            ProfileLoadingState(),
            const ProfileLoadedState(user: tUser),
          ]),
        );
        verify(mockGetUser(any));
      },
      expect: () => [
        // Assert the expected states
        ProfileLoadingState(),
        const ProfileLoadedState(user: tUser),
      ],
    );
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileFailureState] when GetProfileEvent fails",
      build: () => profileBloc,
      act: (bloc) async {
        when(mockGetUser(any)).thenAnswer(
            (_) async => const Left(ServerFailure("Server Failure")));

        bloc.add(const GetProfileEvent());
        await expectLater(
          profileBloc.stream,
          emitsInOrder([
            ProfileLoadingState(),
            const ProfileFailureState(error: ServerFailure("Server Failure"))
          ]),
        );

        verify(mockGetUser(any));
      },
      expect: () => [
        ProfileLoadingState(),
        isA<ProfileFailureState>(),
      ],
    );
  });
  group('edit Profile', () {
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileSavingState, ProfileSavedState] when EditProfileEvent is added",
      build: () => profileBloc,
      act: (bloc) async {
        when(mockEditUserProfile(any))
            .thenAnswer((_) async => const Right(tUser));

        bloc.add(const EditProfileEvent(user: tUser));
        await expectLater(
          profileBloc.stream,
          emitsInOrder([
            ProfileSavingState(),
            const ProfileSavedState(user: tUser),
          ]),
        );
        verify(mockEditUserProfile(any));
      },
      expect: () => [
        ProfileSavingState(),
        const ProfileSavedState(user: tUser),
      ],
    );
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileFailureState] when EditProfileEvent fails",
      build: () => profileBloc,
      act: (bloc) async {
        when(mockEditUserProfile(any)).thenAnswer(
            (_) async => const Left(ServerFailure("Server Failure")));

        bloc.add(const EditProfileEvent(user: tUser));
        await expectLater(
          profileBloc.stream,
          emitsInOrder([
            ProfileSavingState(),
            const ProfileFailureState(error: ServerFailure("Server Failure"))
          ]),
        );
        verify(mockEditUserProfile(any));
      },
      expect: () => [
        ProfileSavingState(),
        isA<ProfileFailureState>(),
      ],
    );
  });

  group('image Uploading', () {
    blocTest<ProfileBloc, ProfileState>(
      "should emit [UpLoadingState, UpLoadedState] when EditProfilePictureEvent is added",
      build: () => profileBloc,
      act: (bloc) async {
        when(mockEditUserProfile(any))
            .thenAnswer((_) async => const Right(tUser));

        bloc.add(const EditProfilePictureEvent(user: tUser));
        await expectLater(
          profileBloc.stream,
          emitsInOrder([
            UpLoadingState(),
            const UpLoadedState(user: tUser),
            ProfileLoadingState(),
            const ProfileLoadedState(user: tUser),
          ]),
        );
        verify(mockEditUserProfile(any));
      },
      expect: () => [
        UpLoadingState(),
        const UpLoadedState(user: tUser),
        ProfileLoadingState(),
        const ProfileLoadedState(user: tUser),
      ],
    );
    blocTest<ProfileBloc, ProfileState>(
      "should emit [UploadingFailureState] when EditProfilePictureEvent fails",
      build: () => profileBloc,
      act: (bloc) async {
        when(mockEditUserProfile(any)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        bloc.add(const EditProfilePictureEvent(user: tUser));
        await expectLater(
          profileBloc.stream,
          emitsInOrder([
            UpLoadingState(),
            const UploadingFailureState(error: ServerFailure("Server Failure")),
            ProfileLoadingState(),
            const ProfileFailureState(error: ServerFailure("Server Failure"))
          ]),
        );
        verify(mockEditUserProfile(any));
      },
      expect: () => [
        UpLoadingState(),
        isA<UploadingFailureState>(),
        ProfileLoadingState(),
        isA<ProfileFailureState>()
      ],
    );
  });
}
