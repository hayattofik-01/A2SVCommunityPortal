import 'package:a2sv_community_portal_mobile/features/application_page/data/datasources/application_step_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/data/repositary/application_step_repository_impl.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/repositary/application_step_repository.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/usecases/application_step_usecase.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/bloc/application_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> applicationInit() async {
  //! Features - Application
  //usecase
  sl.registerLazySingleton(() => GetSteps(applicationStepRepo: sl()));
  // repository
  sl.registerLazySingleton<ApplicationStepRepo>(() => ApplicationStepRepoImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));

  // datasource
  sl.registerLazySingleton<ApplicationStepRemoteDataSource>(
      () => ApplicationStepRemoteDataSourceImpl(client: sl(),sharedPreferences: sl()));

  // bloc
  sl.registerFactory(() => ApplicationBloc(getStep: sl()));
}
