import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/data/datasources/application_step_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/data/models/application_step_model.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/entities/application_step_entity.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/repositary/application_step_repository.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

class ApplicationStepRepoImpl implements ApplicationStepRepo {
  final ApplicationStepRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ApplicationStepRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ApplicationStepEntity>>>
      getApplicationStepFromDataSource() async {
    if (await networkInfo.isConnected) {
      try {
        var result = <ApplicationStepEntity>[];
        final rawData = await remoteDataSource.getApplicationStepFromApi();
        for (var data in rawData) {
          result.add(ApplicationStepModel.fromJson(data));
        }

        return right(result);
      } on ServerException catch (_) {
        return const Left(ServerFailure(serverFaliure));
      } catch (e) {
        return left(const GeneralFailure(unknown));
      }
    } else {
      return const Left(NoConnectionFailure(noConnectionError));
    }
  }
}
