import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:streamx/features/search/data/search_request_response.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = Loading;
  const factory SearchState.loaded(SearchResponse searchResponse) = Loaded;
  const factory SearchState.error(String error) = Error;
}
