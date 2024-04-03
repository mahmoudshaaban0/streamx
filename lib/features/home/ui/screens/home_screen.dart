import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamx/core/helpers/spacing.dart';
import 'package:streamx/core/widgets/global_error_widget.dart';
import 'package:streamx/features/home/logic/cubit/top_rated_cubit.dart';
import 'package:streamx/features/home/logic/cubit/top_rated_state.dart';
import 'package:streamx/features/home/logic/cubit/trending_movie_cubit.dart';
import 'package:streamx/features/home/logic/cubit/trending_movie_state.dart';
import 'package:streamx/features/home/ui/widgets/category_item_widget.dart';
import 'package:streamx/features/home/ui/widgets/custom_appbar_widget.dart';
import 'package:streamx/features/home/ui/widgets/headline_bar.dart';
import 'package:streamx/features/home/ui/widgets/movie_item_skelton.dart';
import 'package:streamx/features/home/ui/widgets/movie_item_widget.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/top_search_item_skelton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchMoviesInParallel();
  }

  Future<void> fetchMoviesInParallel() async {
    await Future.wait([
      context.read<TopRatedCubit>().getTopRatedMovies(),
      context.read<TrendingMovieCubit>().getTrendingMovies(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                const CucstomAppBarWidget(),
                verticalSpace(24),
                const CustomCarouselSlider(),
                verticalSpace(20),
                HeadLineWidget(
                    title: 'Recommended for you', showAll: 'See All'),
                verticalSpace(16),
                BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        loading: () => const MovieSkeltonWidget(),
                        failure: (error) => GlobalErrorWidget(
                              text: error,
                              onRetry: () {
                                context
                                    .read<TrendingMovieCubit>()
                                    .getTrendingMovies();
                                context
                                    .read<TopRatedCubit>()
                                    .getTopRatedMovies();
                              },
                            ),
                        success: (media) {
                          return SizedBox(
                            width: double.infinity,
                            height: 250.h,
                            child: ListView.builder(
                                itemCount: media.results.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: MovieItemWidget(
                                      title: media.results[index].title ?? '',
                                      subTitle: media.results[index].voteAverage
                                          .toStringAsFixed(2),
                                      imageUrl:
                                          media.results[index].backdropPath,
                                    ),
                                  );
                                }),
                          );
                        },
                        orElse: () {
                          return const SizedBox();
                        });
                  },
                ),
                verticalSpace(16),
                HeadLineWidget(title: 'Top Searches', showAll: 'See All'),
                verticalSpace(16),
                BlocBuilder<TopRatedCubit, TopRatedState>(
                  buildWhen: (previous, current) {
                    return previous != current;
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const TopSearchItemSkeltonWidget(),
                      failure: (error) => GlobalErrorWidget(
                          text: error,
                          onRetry: () {
                            context
                                .read<TrendingMovieCubit>()
                                .getTrendingMovies();
                            context.read<TopRatedCubit>().getTopRatedMovies();
                          }),
                      orElse: () {
                        return const SizedBox();
                      },
                      loaded: (mediaModel) {
                        return ListView.builder(
                          itemCount: mediaModel.results.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CategoryItemWidget(
                                title: mediaModel.results[index].name,
                                subTitle:
                                    mediaModel.results[index].originalName,
                                imageUrl: mediaModel.results[index].posterPath,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
