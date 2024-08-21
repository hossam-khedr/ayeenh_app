import 'package:ayeenh/core/utilities/failure.dart';
import 'package:ayeenh/features/auth/domain/repo/auth_repo.dart';
import 'dart:async';

import 'package:dartz/dartz.dart';
class LoginUseCase{
  final AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  Future<Either<Failure,void>> execute(String email,String password)async{
  return  await authRepo.login(email, password);
  }
}