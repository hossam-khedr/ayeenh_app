import 'package:ayeenh/features/user_request/presentation/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/request_uesr.dart';
import '../../domain/use_cases/send_user_request_use_case.dart';

class RequestUserCubit extends Cubit<RequestUserStates> {
  final SendUserRequestUseCase sendUserRequestUseCase;

  RequestUserCubit({required this.sendUserRequestUseCase})
      : super(RequestUserStates());
DateTime? selectedDate;
  Future<void> requestDataSelected(BuildContext context) async {
    selectedDate??DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      if(!isClosed){
        emit(state.copyWith(status: RequestStatus.selectedData));
      }

    }
  }

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
