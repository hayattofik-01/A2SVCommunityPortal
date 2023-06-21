import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/edit_user_profile.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/get_user.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUser getUser;
  final EditUserProfile editUserProfile;
  ProfileBloc({required this.editUserProfile, required this.getUser})
      : super(ProfileInitialState()) {
    on<GetProfileEvent>(_loadUser);
    on<EditProfileEvent>(_editUser);
  }
  void _loadUser(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final result = await getUser(event.userId);
    emit(_loadingSucessOrFailure(result));
  }

  void _editUser(EditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileSavingState());
    final result = await editUserProfile(event.user);
    emit(_updatingSucessOrFailure(result));
  }

  ProfileState _loadingSucessOrFailure(Either<Failure, UserEntity> data) {
    return data.fold(
      (failure) => ProfileFailureState(error: failure),
      (user) => ProfileLoadedState(user: user),
    );
  }

  ProfileState _updatingSucessOrFailure(Either<Failure, UserEntity> data) {
    return data.fold(
      (falure) => ProfileFailureState(error: falure),
      (user) => ProfileSavedState(user: user),
    );
  }
}
