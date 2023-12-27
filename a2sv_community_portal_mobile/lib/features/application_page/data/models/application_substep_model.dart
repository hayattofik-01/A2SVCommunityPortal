import 'package:a2sv_community_portal_mobile/features/application_page/domain/entities/application_substep_entity.dart';

class ApplicationSubStepModel extends ApplicationSubStepEntity {
  ApplicationSubStepModel({
    required bool isCompleted,
    required String subStepName,
    required String description,
  }) : super(
          isCompleted: isCompleted,
          subStepName: subStepName,
          description: description,
        );

  factory ApplicationSubStepModel.fromJson(Map<String, dynamic> json) {
    return ApplicationSubStepModel(
      isCompleted: json["isCompleted"],
      subStepName: json["subStepName"],
      description: json["description"],
    );
  }
}