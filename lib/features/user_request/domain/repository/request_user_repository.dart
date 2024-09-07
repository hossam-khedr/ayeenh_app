import 'package:ayeenh/features/user_request/domain/entities/request_uesr.dart';
import 'package:dartz/dartz.dart';
abstract class RequestUserRepository{
  Future<Either<String,void>>sendUserRequest(RequestUser p);
}