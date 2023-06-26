part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => [];
}

class ApplicationInitial extends ApplicationState {
  final String message;

  const ApplicationInitial({required this.message});
}

class ApplicationLoading extends ApplicationState {}

class ApplicationLoaded extends ApplicationState {
  final List<ApplicationStepEntity> applicationStepEntity;

  const ApplicationLoaded({required this.applicationStepEntity});

  @override
  List<Object> get props => [applicationStepEntity];
}

class ApplicationError extends ApplicationState {
  final String message;

  const ApplicationError({required this.message});
}
