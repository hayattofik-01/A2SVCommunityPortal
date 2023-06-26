import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_local_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/datasource/login_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/data/repository/login_repo_impl.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/auth_repository.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/usecases/reigster_user.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';


import '../features/authentication/presentation/bloc/login_bloc/login_bloc.dart';

final sl = GetIt.instance;
Future<void> authInit() async  {
 
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


}

