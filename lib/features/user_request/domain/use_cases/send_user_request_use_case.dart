import 'package:ayeenh/features/user_request/domain/repository/request_user_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/request_uesr.dart';

class SendUserRequestUseCase {
  final RequestUserRepository requestUserRepository;

  SendUserRequestUseCase({required this.requestUserRepository});

  Future<Either<String, void>> call(RequestUser p) async {
    return await requestUserRepository.sendUserRequest(p);
  }
}
