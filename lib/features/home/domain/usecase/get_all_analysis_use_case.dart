import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:ayeenh/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/analysis_entity.dart';

class GetAllAnalysisUseCase {
  final HomeRepo homeRepo;
  GetAllAnalysisUseCase({required this.homeRepo});
  Future<Either<String,List<AnalysisModel>>>call()async{
    return homeRepo.getAllAnalysis();
  }
}