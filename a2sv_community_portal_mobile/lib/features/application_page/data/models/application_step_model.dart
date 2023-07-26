import 'package:a2sv_community_portal_mobile/features/application_page/data/models/application_substep_model.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/entities/application_step_entity.dart';

class ApplicationStepModel extends ApplicationStepEntity {
  const ApplicationStepModel({
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
