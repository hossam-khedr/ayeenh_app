import '../../data/models/analysis_model.dart';
import '../../domain/entities/analysis_entity.dart';

enum HomeStatus {
  init,
  loading,
  success,
  failure,
}

extension HomeStateEnum on HomeStates {
  bool get isInitial => homeStatus == HomeStatus.init;

  bool get isLoading => homeStatus == HomeStatus.loading;

  bool get isFailure => homeStatus == HomeStatus.failure;

  bool get isSuccess => homeStatus == HomeStatus.success;
}

class HomeStates {
  String? errorMassage;
  HomeStatus homeStatus;
  List<AnalysisModel> analysis;

  HomeStates({
    this.errorMassage,
    this.homeStatus = HomeStatus.init,
    this.analysis = const [],
  });

  HomeStates copyWith(
      {String? errorMassage,
      HomeStatus? homeStatus,
      List<AnalysisModel>? analysis}) {
    return HomeStates(
      errorMassage: errorMassage ?? this.errorMassage,
      homeStatus: homeStatus ?? this.homeStatus,
      analysis: analysis ?? this.analysis,
    );
  }
}
