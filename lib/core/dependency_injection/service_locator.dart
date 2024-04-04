import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:streamx/features/home/repo/top_rated_repo.dart';
import 'package:streamx/features/home/repo/trending_movie_repo.dart';
import 'package:streamx/features/search/repo/search_repo.dart';

import '../../features/home/logic/cubit/top_rated_cubit.dart';
import '../../features/home/logic/cubit/trending_movie_cubit.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/search/logic/cubit/upcoming_cubit.dart';
import '../../features/search/repo/upcoming_repo.dart';
import '../networking/network_info.dart';

final GetIt sl = GetIt.instance;

void setup() {
  // Services
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Repositories
  sl.registerLazySingleton(() => TrendingMoviesRepo(sl()));
  sl.registerLazySingleton(() => TopRatedRepo(sl()));
  sl.registerLazySingleton(() => UpComingRepo(sl()));
  sl.registerLazySingleton(() => SearchRepo(sl()));

  // Blocs/Cubits
  sl.registerFactory(() => TrendingMovieCubit(sl()));
  sl.registerFactory(() => TopRatedCubit(sl()));
  sl.registerFactory(() => UpcomingCubit(sl()));
  sl.registerFactory(() => SearchCubit(sl()));
}
