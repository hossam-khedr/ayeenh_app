
import 'package:dartz/dartz.dart';

import '../../data/models/analysis_model.dart';
abstract class HomeRepo{
  Future<Either<String,List<AnalysisModel>>>getAllAnalysis();
}