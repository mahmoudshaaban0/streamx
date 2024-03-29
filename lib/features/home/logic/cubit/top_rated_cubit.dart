import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamx/core/helpers/logging_service.dart';
import 'package:streamx/features/home/logic/cubit/top_rated_state.dart';
import 'package:streamx/features/home/repo/top_rated_repo.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final TopRatedRepo _topRatedMoviesRepo;
  TopRatedCubit(this._topRatedMoviesRepo)
      : super(const TopRatedState.initial());

  Future<void> getTopRatedMovies() async {
    emit(const TopRatedState.loading());
    final response = await _topRatedMoviesRepo.topRated();
    LoggingService.logInfo(response.toString());
    response.when(
      success: (response) {
        emit(TopRatedState.loaded(response));
      },
      failure: (error) {
        emit(TopRatedState.failure(error));
      },
    );
  }
}
