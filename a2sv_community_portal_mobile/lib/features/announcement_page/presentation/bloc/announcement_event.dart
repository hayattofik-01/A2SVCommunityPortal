part of 'announcement_bloc.dart';

@immutable
abstract class AnnouncementEvent extends Equatable {}

class GetAnnouncementEvent extends AnnouncementEvent {
  @override
  List<Object?> get props => [];
}
