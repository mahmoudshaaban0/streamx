import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamx/core/helpers/logging_service.dart';
import 'package:streamx/features/search/logic/cubit/search_state.dart';
import 'package:streamx/features/search/repo/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(const SearchState.initial());

  void getSearchData(String query) async {
    emit(const SearchState.loading());
    final response = await _searchRepo.getSearchResponse(query);
    LoggingService.logInfo(response.toString());
    response.when(success: (data) {
      emit(SearchState.loaded(data));
    }, failure: (error) {
      emit(SearchState.error(error));
    });
  }
}
