part of 'upcoming_contests_bloc.dart';

abstract class UpcomingContestsState extends Equatable {
  const UpcomingContestsState();

  @override
  List<Object> get props => [];
}

class UpcomingContestsInitial extends UpcomingContestsState {}

class UpcomingContestsLoading extends UpcomingContestsState {}

class UpcomingContestsLoaded extends UpcomingContestsState {
  final List<Contest> upcomingContests;

  const UpcomingContestsLoaded({required this.upcomingContests});
}

class UpcomingContestsError extends UpcomingContestsState {
  final String message;

  const UpcomingContestsError({required this.message});
}
