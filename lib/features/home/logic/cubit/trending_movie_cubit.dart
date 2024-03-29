import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamx/features/home/logic/cubit/trending_movie_state.dart';
import 'package:streamx/features/home/repo/trending_movie_repo.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  final TrendingMoviesRepo _trendingMoviesRepo;
  TrendingMovieCubit(this._trendingMoviesRepo)
      : super(const TrendingMovieState.initial());

  Future<void> getTrendingMovies() async {
    emit(const TrendingMovieState.loading());
    final response = await _trendingMoviesRepo.getMediaModel();
    debugPrint(response.toString());
    response.when(
      success: (response) {
        emit(TrendingMovieState.success(response));
      },
      failure: (error) {
        emit(TrendingMovieState.failure(error));
      },
    );
  }
}
