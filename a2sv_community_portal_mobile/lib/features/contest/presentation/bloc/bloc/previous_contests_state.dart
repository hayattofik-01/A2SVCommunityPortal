part of 'previous_contests_bloc.dart';

abstract class PreviousContestsState extends Equatable {
  const PreviousContestsState();

  @override
  List<Object> get props => [];
}

class PreviousContestsInitial extends PreviousContestsState {}

class PreviousContestsLoading extends PreviousContestsState {}

class PreviousContestsLoaded extends PreviousContestsState {
  final List<Contest> previousContests;

  const PreviousContestsLoaded({required this.previousContests});
}

class PreviousContestsError extends PreviousContestsState {
  final String message;

  const PreviousContestsError({required this.message});
}
