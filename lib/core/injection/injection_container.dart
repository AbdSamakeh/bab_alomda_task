import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../theme/theme_cubit/theme_cubit.dart';
import '../../features/news/data/datasources/local/news_local.dart';
import '../../features/news/data/datasources/remote/news_remote.dart';
import '../../features/news/data/repositories/news_repository_implement.dart';
import '../../features/news/presentation/cubit/news_cubit/news_cubit.dart';

import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/news/domain/usecases/get_news_usecase.dart';

//Get It Global Instance
final sl = GetIt.instance;

//!Function To Initilized Get It Dependacy Injections
//And Register Classes
Future<void> init() async {
//!Features - News
  //Blocs
  sl.registerFactory(() => NewsCubit(newsUsecase: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetNewsUsecase(newsRepository: sl()));

  // Reposetories
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImplements(
      newsLocal: sl(),
      newsRemote: sl(),
    ),
  );

  // DataSources
  // Remote
  sl.registerLazySingleton<NewsRemote>(() => NewsRemoteImplements());
  // Local
  sl.registerLazySingleton<NewsLocal>(() => NewsLocalImplements());

  //! Core
  sl.registerFactory(() => ThemeCubit());

  //! External
  sl.registerLazySingleton(() => Client());
}

final ThemeCubit themeCubit = ThemeCubit();
