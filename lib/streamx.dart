import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamx/core/dependency_injection/service_locator.dart';
import 'package:streamx/core/navigation/app_router.dart';
import 'package:streamx/core/theme/app_strings.dart';
import 'package:streamx/core/theme/app_theme.dart';
import 'package:streamx/features/home/logic/cubit/top_rated_cubit.dart';
import 'package:streamx/features/home/logic/cubit/trending_movie_cubit.dart';
import 'package:streamx/features/search/logic/cubit/search_cubit.dart';
import 'package:streamx/features/search/logic/cubit/upcoming_cubit.dart';

class StreamX extends StatelessWidget {
  const StreamX({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TrendingMovieCubit>(
              create: (BuildContext context) => sl<TrendingMovieCubit>()),
          BlocProvider<TopRatedCubit>(
              create: (BuildContext context) => sl<TopRatedCubit>()),
          BlocProvider<UpcomingCubit>(
              create: (BuildContext context) => sl<UpcomingCubit>()),
          BlocProvider<SearchCubit>(
              create: (BuildContext context) => sl<SearchCubit>()),
        ],
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppStrings.kAppName,
            theme: getApplicationTheme(),
            routerConfig: AppRouter().router),
      ),
    );
  }
}
