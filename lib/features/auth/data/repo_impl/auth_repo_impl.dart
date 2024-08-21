import 'package:ayeenh/core/utilities/failure.dart';
import 'package:ayeenh/features/auth/data/data_source/remot/auth_remot_data_source.dart';
import 'package:ayeenh/features/auth/domain/entities/user_entitie.dart';
import 'package:ayeenh/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await authRemoteDataSource.login(email, password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(errorMassage: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> register(String email, String password) async {
    try {
      await authRemoteDataSource.register(email, password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(errorMassage: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(UserEntity userEntity) async {
    try {
      await authRemoteDataSource.saveUser(userEntity);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(errorMassage: e.message!));
    }
  }
}
