import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:streamx/features/home/data/top_rated_response.dart';

import '../../data/media_item_response.dart';

part 'trending_movie_state.freezed.dart';

@freezed
class TrendingMovieState with _$TrendingMovieState {
  const factory TrendingMovieState.initial() = _Initial;
  const factory TrendingMovieState.loading() = Loading;
  const factory TrendingMovieState.success(MovieItem mediaModel) = Success;
  const factory TrendingMovieState.failure(String error) = Error;

  const factory TrendingMovieState.loaded(TopRated mediaModel) = loaded;
}
