import 'package:ayeenh/core/utilities/failure.dart';
import 'package:ayeenh/features/auth/domain/entities/user_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo{
  Future<Either<Failure,void>>register(String email,String password);
  Future<Either<Failure,void>>login(String email,String password);
  Future<Either<Failure,void>>saveUser(UserEntity userEntity);
}