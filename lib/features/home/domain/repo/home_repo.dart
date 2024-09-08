
import 'package:ayeenh/features/user_request/data/models/user_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/analysis_model.dart';
abstract class HomeRepo{
  Future<Either<String,List<AnalysisModel>>>getAllAnalysis();
  Future<Either<String,List<UserRequestModel>>>getAllRequests();
}