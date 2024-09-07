import 'package:ayeenh/features/home/data/data_source/data_source.dart';
import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:ayeenh/features/home/domain/entities/analysis_entity.dart';
import 'package:ayeenh/features/home/domain/repo/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  final HomeDataSource dataSource;
  HomeRepoImpl({required this.dataSource});
  @override
  Future<Either<String, List<AnalysisModel>>> getAllAnalysis()async {
    try{
      final response = await dataSource.getAllAnalysis();
      return Right(response);
    } on FirebaseException catch(e){
      return Left(e.message!);
    }
  }

}