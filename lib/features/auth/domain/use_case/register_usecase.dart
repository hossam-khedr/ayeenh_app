import 'package:ayeenh/core/utilities/failure.dart';
import 'package:ayeenh/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<Either<Failure,void>> execute(String email, String password) async {
   return await authRepo.register(email, password);
  }
}
