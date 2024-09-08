import 'package:ayeenh/features/home/domain/repo/home_repo.dart';
import 'package:ayeenh/features/user_request/data/models/user_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/analysis_model.dart';

class GetAllRequestsUseCase{
  final HomeRepo homeRepo;
  GetAllRequestsUseCase({required this.homeRepo});
  Future<Either<String,List<UserRequestModel>>>call()async{
    return await homeRepo.getAllRequests();
  }
}