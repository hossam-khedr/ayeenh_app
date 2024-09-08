import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:ayeenh/features/home/domain/usecase/get_all_requests_use_case.dart';
import 'package:ayeenh/features/home/presentation/logic/state.dart';
import 'package:ayeenh/features/user_request/data/models/user_request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_all_analysis_use_case.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllAnalysisUseCase getAllAnalysisUseCase;
  final GetAllRequestsUseCase getAllRequestsUseCase;

  HomeCubit({
    required this.getAllAnalysisUseCase,
    required this.getAllRequestsUseCase,
  }) : super(HomeStates());

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
  Future<void>getRequests()async{
    debugPrint('START: cubit getAllRequests');
    List<UserRequestModel>requestsList = state.requests.toList();
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    (await getAllRequestsUseCase.call()).fold((failure){
      emit(state.copyWith(homeStatus: HomeStatus.failure,errorMassage: failure));
    }, (requests){
      requestsList =requests;
      emit(state.copyWith(homeStatus: HomeStatus.success,requests: requests));
    });
    debugPrint('END: cubit getAllRequests');
  }
}
