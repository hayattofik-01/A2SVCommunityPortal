part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {
  final String userId;

  const GetProfileEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}

class EditProfilePictureEvent extends ProfileEvent {
  final UserEntity user;

  const EditProfilePictureEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class EditProfileEvent extends ProfileEvent {
  final UserEntity user;

  const EditProfileEvent({required this.user});

  @override
  List<Object> get props => [user];
}
