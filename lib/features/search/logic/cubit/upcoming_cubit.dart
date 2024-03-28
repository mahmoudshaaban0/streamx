import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamx/features/search/logic/cubit/upcoming_state.dart';
import 'package:streamx/features/search/repo/upcoming_repo.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final UpComingRepo _upComingRepo;

  UpcomingCubit(this._upComingRepo) : super(const UpcomingState.initial());

  void getUpcomingData() async {
    final response = await _upComingRepo.getUpcomingData();
    response.when(success: (response) {
      emit(UpcomingState.success(response));
    }, failure: (error) {
      emit(UpcomingState.failure(error));
    });
  }
}
