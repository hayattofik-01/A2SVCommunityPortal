import 'package:a2sv_community_portal_mobile/features/home/data/models/application_substep_model.dart';
import 'package:a2sv_community_portal_mobile/features/home/domain/entities/application_step_entity.dart';
import 'package:equatable/equatable.dart';

class ApplicationStepModel extends ApplicationStepEntity with EquatableMixin {
  ApplicationStepModel({
    required bool isCompleted,
    required String stepName,
    required List<ApplicationSubStepModel> subSteps,
  }) : super(
          isCompleted: isCompleted,
          stepName: stepName,
          subSteps: subSteps,
        );

  factory ApplicationStepModel.fromJson(Map<String, dynamic> json) {
    final subStepsJson = json['subSteps'] as List<dynamic>;
    final subSteps = subStepsJson
        .map((subStepJson) => ApplicationSubStepModel.fromJson(subStepJson))
        .toList();

    return ApplicationStepModel(
      isCompleted: json["isCompleted"],
      stepName: json["stepName"],
      subSteps: subSteps,
    );
  }
}
