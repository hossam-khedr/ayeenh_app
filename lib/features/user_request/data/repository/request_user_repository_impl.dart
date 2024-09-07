import 'package:ayeenh/features/user_request/domain/entities/request_uesr.dart';
import 'package:ayeenh/features/user_request/domain/repository/request_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../data_source.dart';

class RequestUserRepositoryImpl implements RequestUserRepository {
  final RequestDataSource requestUserDataSource;

  RequestUserRepositoryImpl({required this.requestUserDataSource});

  @override
  Future<Either<String, void>> sendUserRequest(RequestUser p) async {
    try {
      await requestUserDataSource.sendUserRequest(p);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e.message ?? 'ERROR NOT FOUND');
    }
  }
}
