part of 'previous_contests_bloc.dart';

abstract class PreviousContestsEvent extends Equatable {
  const PreviousContestsEvent();

  @override
  List<Object> get props => [];
}

class FetchPreviousContests extends PreviousContestsEvent {}