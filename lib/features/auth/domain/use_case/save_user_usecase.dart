import 'package:ayeenh/core/utilities/failure.dart';
import 'package:ayeenh/features/auth/domain/entities/user_entitie.dart';
import 'package:ayeenh/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SaveUserUseCase {
  final AuthRepo authRepo;

  SaveUserUseCase({required this.authRepo});

  Future<Either<Failure,void>> execute(UserEntity userEntity) async {
   return await authRepo.saveUser(userEntity);
  }
}
