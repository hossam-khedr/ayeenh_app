import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:ayeenh/features/home/presentation/logic/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_all_analysis_use_case.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllAnalysisUseCase getAllAnalysisUseCase;
  HomeCubit({required this.getAllAnalysisUseCase}) : super(HomeStates());

  Future<void> getAllAnalysis() async {
    debugPrint('START: cubit getAllAnalysis');
    List<AnalysisModel> analysisList = state.analysis.toList();
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    (await getAllAnalysisUseCase.call()).fold(
      (failure) {
        emit(
          state.copyWith(
            homeStatus: HomeStatus.failure,
            errorMassage: failure,
          ),
        );
      },
      (analysis) {
        analysisList = analysis;
        emit(
          state.copyWith(
            homeStatus: HomeStatus.success,
            analysis: analysis,
          ),
        );
        debugPrint('START: cubit getAllAnalysis');
      },
    );
  }
}
