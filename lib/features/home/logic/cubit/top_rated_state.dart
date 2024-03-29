import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:streamx/features/home/data/top_rated_response.dart';

part 'top_rated_state.freezed.dart';

@freezed
class TopRatedState with _$TopRatedState {
  const factory TopRatedState.initial() = _Initial;
  const factory TopRatedState.loading() = Loading;
  const factory TopRatedState.loaded(TopRated topRated) = Loaded;
  const factory TopRatedState.failure(String error) = Failure;
}
