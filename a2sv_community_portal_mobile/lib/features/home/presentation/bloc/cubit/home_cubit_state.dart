import 'package:a2sv_community_portal_mobile/features/home/domain/entities/application_step_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeLoaded extends HomeState {
  final ApplicationStepEntity applicationStep;
  final int currentStepIndex;

  HomeLoaded(this.applicationStep, {this.currentStepIndex = 0});

  HomeLoaded copyWith({int? currentStepIndex}) {
    return HomeLoaded(
      applicationStep,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
    );
  }

  @override
  List<Object> get props => [applicationStep, currentStepIndex];
}