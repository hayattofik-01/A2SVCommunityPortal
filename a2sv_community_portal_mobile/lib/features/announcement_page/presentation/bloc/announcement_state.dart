part of 'announcement_bloc.dart';

@immutable
abstract class AnnouncementState {}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementLoading extends AnnouncementState {}

class AnnouncementLoaded extends AnnouncementState {
  final List<Announcement> announcements;

  AnnouncementLoaded({required this.announcements});
}

class AnnouncementError extends AnnouncementState {
  final String message;

  AnnouncementError({required this.message});
}
