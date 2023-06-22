import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/datasources/contest_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/repositories/contest_repository_impl.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/repository/contest_repository.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_past_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_upcoming_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerLazySingletonAsync(() => sharedPreferences);
  await GetIt.instance.isReady<SharedPreferences>();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  sl.registerFactory<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //! Features - UserProfile

  //! Features - Contest
  //usecase
  sl.registerLazySingleton(() => GetPastContests(repository: sl()));
  sl.registerLazySingleton(() => GetUpcomingContests(repository: sl()));
  // repository
  sl.registerLazySingleton<ContestRepository>(() => ContestRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));

  // datasource
  sl.registerLazySingleton<ContestRemoteDataSource>(
      () => ContestRemoteDataSourceImpl(client: sl()));

  // bloc
  sl.registerFactory(() => UpcomingContestsBloc(getUpcomingContests: sl()));
  sl.registerFactory(() => PreviousContestsBloc(getPreviousContests: sl()));

  //! Features - Application

  //! Features - Notification

  //! Features - Authentication

  //! External
}
