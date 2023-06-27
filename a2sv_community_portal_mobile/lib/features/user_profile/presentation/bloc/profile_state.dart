part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSavingState extends ProfileState {}

class ProfileSavedState extends ProfileState {
  final UserEntity user;
  const ProfileSavedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class UpLoadingState extends ProfileState {}

class UpLoadedState extends ProfileState {
  final UserEntity user;
  const UpLoadedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileLoadedState extends ProfileState {
  final UserEntity user;
  const ProfileLoadedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileFailureState extends ProfileState {
  final Failure error;

  const ProfileFailureState({required this.error});

  @override
  List<Object?> get props => [error];
}
