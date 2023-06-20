import 'package:a2sv_community_portal_mobile/features/home/domain/entities/application_substep_entity.dart';
import 'package:equatable/equatable.dart';

class ApplicationStepEntity extends Equatable {
  final bool isCompleted;
  final String stepName;
  final List<ApplicationSubStepEntity> subSteps;

  const ApplicationStepEntity({
    required this.isCompleted,
    required this.stepName,
    required this.subSteps,
  });
  @override
  List<Object?> get props => [isCompleted, stepName,subSteps];

}

