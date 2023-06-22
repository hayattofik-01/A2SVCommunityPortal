import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - UserProfile


  //! Features - Contest


  //! Features - Application


  //! Features - Notification 


  //! Features - Authentication

  //! Core
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerLazySingletonAsync(() => sharedPreferences);
  await GetIt.instance.isReady<SharedPreferences>();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! External
}
