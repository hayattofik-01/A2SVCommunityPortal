import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/entities/application_step_entity.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/repositary/application_step_repository.dart';

import 'package:dartz/dartz.dart';

class ApplicationStepUseCases {
  ApplicationStepUseCases({required this.applicationStepRepo});
  final ApplicationStepRepo applicationStepRepo;

  Future<Either<Failure, List<ApplicationStepEntity>>> getSteps() async {
    return await applicationStepRepo.getApplicationStepFromDataSource();
    
  }
}
