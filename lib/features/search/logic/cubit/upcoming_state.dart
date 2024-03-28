import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:streamx/features/search/data/upcoming_response.dart';

part 'upcoming_state.freezed.dart';

@freezed
class UpcomingState with _$UpcomingState {
  const factory UpcomingState.initial() = _Initial;
  const factory UpcomingState.loading() = _Loading;
  const factory UpcomingState.success(Upcoming upcoming) = _Success;
  const factory UpcomingState.failure(String error) = _Failure;
}
