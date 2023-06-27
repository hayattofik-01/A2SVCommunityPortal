import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/datasources/contest_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/repositories/contest_repository_impl.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/repository/contest_repository.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_past_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_upcoming_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/repository/notification_repository.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/usecases/get_notifications.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/usecases/send_is_read.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:a2sv_community_portal_mobile/injections/application_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'auth_injection.dart';

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

  //! FEATURE - NOTIFICATION
  // usecase
  sl.registerLazySingleton(() => GetNotification(repository: sl()));
  sl.registerLazySingleton(() => SendIsRead(repository: sl()));

  // repository
  sl.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(
            networkInfo: sl(),
            remoteDataSource: sl(),
          ));
  // datasource
  sl.registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSourceImpl(client: sl()));
  // bloc
  sl.registerFactory(() => NotificationBloc(
        getNotifications: sl(),
        sendIsRead: sl(),
      ));

  //! Features - Application
  applicationInit();
  //! Features - Notification

  //! Features - Authentication
  authInit();

  //! External
}
