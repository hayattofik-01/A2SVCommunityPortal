import 'package:a2sv_community_portal_mobile/features/user_profile/data/datasources/user_local_data_source.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/datasources/user_remote_data_source.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/repositories/user_repository_implementation.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/repositories/user_repository.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/edit_user_profile.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/get_user.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> profileInit() async {
  const String uri =
      "https://a2sv-community-portal-api.onrender.com/api/Profile/me";
  sl.registerLazySingleton(() => http.MultipartRequest('POST', Uri.parse(uri)));
  //bloc
  sl.registerFactory(() => ProfileBloc(editUserProfile: sl(), getUser: sl()));

  //usecases
  sl.registerLazySingleton(() => GetUser(repository: sl()));
  sl.registerLazySingleton(() => EditUserProfile(repository: sl()));

  //repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //datasources
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      client: sl(), sharedPreferences: sl(), request: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: sl()));
}
