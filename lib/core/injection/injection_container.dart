import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

//Get It Global Instance
final sl = GetIt.instance;

//!Function To Initilized Get It Dependacy Injections
Future<void> init() async {
//!Features - News
  //Blocs
  // sl.registerFactory(() => SendCodeCubit(usecase: sl()));

  //Usecases
  // sl.registerLazySingleton(() => SendCodeUsecase(repository: sl()));

  // Reposetories
  // sl.registerLazySingleton<AuthRepository>(
  // () => AuthRepositoryImplements(authRemote: sl()));

  // DataSources
  // Remote
  // sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImplement());
  // Local
  // sl.registerLazySingleton<AuthLocal>(() => AuthLocalImplements());

  //! Core

  //! External
  sl.registerLazySingleton(() => Client());
}
