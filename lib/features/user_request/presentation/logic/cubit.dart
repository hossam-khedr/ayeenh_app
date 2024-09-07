import 'package:ayeenh/features/user_request/presentation/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/request_uesr.dart';
import '../../domain/use_cases/send_user_request_use_case.dart';

class RequestUserCubit extends Cubit<RequestUserStates> {
  final SendUserRequestUseCase sendUserRequestUseCase;

  RequestUserCubit({required this.sendUserRequestUseCase})
      : super(RequestUserStates());

  Future<void> sendUserRequest(RequestUser p) async {
    emit(state.copyWith(status: RequestStatus.loading));
    (await sendUserRequestUseCase.call(p)).fold((failure) {
      emit(
          state.copyWith(status: RequestStatus.failure, errorMassage: failure));
    }, (success) {
      emit(state.copyWith(status: RequestStatus.success));
    });
  }
}
