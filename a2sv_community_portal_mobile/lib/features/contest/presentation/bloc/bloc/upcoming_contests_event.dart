part of 'upcoming_contests_bloc.dart';

abstract class UpcomingContestsEvent extends Equatable {
  const UpcomingContestsEvent();

  @override
  List<Object> get props => [];
}

class FetchUpcomingContests extends UpcomingContestsEvent {}