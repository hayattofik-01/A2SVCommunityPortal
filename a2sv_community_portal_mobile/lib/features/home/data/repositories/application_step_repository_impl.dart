import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/home/data/datasources/application_step_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/home/data/models/application_step_model.dart';
import 'package:a2sv_community_portal_mobile/features/home/domain/entities/application_step_entity.dart';
import 'package:a2sv_community_portal_mobile/features/home/domain/repositories/application_step_repository.dart';
import 'package:dartz/dartz.dart';

class ApplicationStepRepoImpl implements ApplicationStepRepo {
  ApplicationStepRepoImpl({required this.remoteDataSource});
  final ApplicationStepRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ApplicationStepEntity>> getApplicationStepFromDataSource() async {
    try {
      final result = await remoteDataSource.getApplicationStepFromApi();
      final applicationStepModel = ApplicationStepModel.fromJson(result);
      return right(applicationStepModel);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
  

}