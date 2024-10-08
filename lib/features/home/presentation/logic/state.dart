import 'package:ayeenh/features/user_request/data/models/user_request_model.dart';

import '../../data/models/analysis_model.dart';
import '../../domain/entities/analysis_entity.dart';

enum HomeStatus {
  init,
  loading,
  success,
  failure,
  searchLoading,
  searchSuccess,
}

extension HomeStateEnum on HomeStates {
  bool get isInitial => homeStatus == HomeStatus.init;

  bool get isLoading => homeStatus == HomeStatus.loading;

  bool get isFailure => homeStatus == HomeStatus.failure;

  bool get isSuccess => homeStatus == HomeStatus.success;

  bool get isSearchSuccess => homeStatus == HomeStatus.searchSuccess;

  bool get isSearchLoading => homeStatus == HomeStatus.searchLoading;
}

class HomeStates {
  String? errorMassage;
  HomeStatus homeStatus;
  List<AnalysisModel> analysis;
  List<AnalysisModel> filterAnalysis;
  List<UserRequestModel> requests;

  HomeStates({
    this.errorMassage,
    this.homeStatus = HomeStatus.init,
    this.analysis = const [],
    this.requests = const [],
    this.filterAnalysis = const[],
  });

  HomeStates copyWith({
    String? errorMassage,
    HomeStatus? homeStatus,
    List<AnalysisModel>? analysis,
    List<AnalysisModel>? filterAnalysis,
    List<UserRequestModel>? requests,
  }) {
    return HomeStates(
        errorMassage: errorMassage ?? this.errorMassage,
        homeStatus: homeStatus ?? this.homeStatus,
        analysis: analysis ?? this.analysis,
        filterAnalysis: filterAnalysis ?? this.filterAnalysis,
        requests: requests ?? this.requests);
  }
}
