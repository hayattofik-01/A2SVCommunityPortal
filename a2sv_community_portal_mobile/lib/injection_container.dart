import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_local_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/repository/login_repo_impl.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/auth_repository.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/reigster_user.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
final sl = GetIt.instance;
Future<void> init() async  {
//Bloc
  sl.registerFactory(() => LoginBloc(loginUser: sl()));
  sl.registerFactory(() => SignUpBloc(registerUser: sl()));
 
// usecases

  sl.registerLazySingleton(() => RegisterUser(repository: sl()));
  sl.registerLazySingleton(() => LoginUser(repository: sl()));
//Repository

  sl.registerLazySingleton<AuthRepository>(() => LoginRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
//Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(() => LoginLocalDataSourceImpl(sharedPreferences: sl()),);

// ignore: non_constant_identifier_names
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  
  sl.registerLazySingleton(() => http.Client());
 //networkinfo
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
sl.registerFactory<NetworkInfo>(()=> NetworkInfoImpl(sl()));
}
