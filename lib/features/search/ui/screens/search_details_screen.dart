import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamx/core/helpers/spacing.dart';
import 'package:streamx/core/theme/app_textstyle.dart';
import 'package:streamx/features/search/data/search_request_response.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../home/logic/cubit/top_rated_cubit.dart';
import '../../../home/logic/cubit/trending_movie_cubit.dart';
import '../../../home/logic/cubit/trending_movie_state.dart';
import '../../../home/ui/widgets/headline_bar.dart';
import '../../../home/ui/widgets/movie_item_skelton.dart';
import '../../../home/ui/widgets/movie_item_widget.dart';

class SearchDetailsScreen extends StatefulWidget {
  final Result searchResponse;
  const SearchDetailsScreen({super.key, required this.searchResponse});

  @override
  State<SearchDetailsScreen> createState() => _SearchDetailsScreenState();
}

class _SearchDetailsScreenState extends State<SearchDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingMovieCubit>().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    "http://image.tmdb.org/t/p/w780/${widget.searchResponse.posterPath}",
                    fit: BoxFit.fill,
                    height: 400,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  // Overlay container with a linear gradient
                  Container(
                    height: 400,
                    width: double.infinity,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0.14, 0.4],
                        colors: [
                          Colors.white, // Starting color of the gradient
                          Colors.white
                              .withOpacity(0.0), // Ending color of the gradient
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Body Line',
                  style:
                      AppTextStyle.fMulishB2Bold.copyWith(color: Colors.black),
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.iconsSearchStar),
                    horizontalSpace(4),
                    Text(
                      widget.searchResponse.voteAverage.toStringAsFixed(2),
                      style: AppTextStyle.fMulishB5Bold
                          .copyWith(color: const Color(0xff4C4E55)),
                    ),
                  ],
                ),
              ),
              verticalSpace(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  widget.searchResponse.overview,
                  style:
                      AppTextStyle.fMulishB3Bold.copyWith(color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: HeadLineWidget(
                    title: 'Recommended for you', showAll: 'See All'),
              ),
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
                              context.read<TopRatedCubit>().getTopRatedMovies();
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
                                    imageUrl: media.results[index].backdropPath,
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
            ],
          ),
        ),
      ),
    );
  }
}
