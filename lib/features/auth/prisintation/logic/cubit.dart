import 'dart:developer';

import 'package:ayeenh/features/auth/domain/entities/user_entitie.dart';
import 'package:ayeenh/features/auth/domain/use_case/login_usecase.dart';
import 'package:ayeenh/features/auth/domain/use_case/register_usecase.dart';
import 'package:ayeenh/features/auth/domain/use_case/save_user_usecase.dart';
import 'package:ayeenh/features/auth/prisintation/logic/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final SaveUserUseCase _saveUserUseCase;

  AuthCubit(this._loginUseCase, this._registerUseCase, this._saveUserUseCase)
      : super(AuthStates());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    (await _loginUseCase.execute(loginEmailController.text, loginPasswordController.text))
        .fold((failure) {
          log(failure.errorMassage);
      emit(
        state.copyWith(
            authStatus: AuthStatus.failure, errorMassage: failure.errorMassage),

      );
    }, (success) {
      emit(state.copyWith(authStatus: AuthStatus.success));
    });
  }

  Future<void> register() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    (await _registerUseCase.execute(
            emailController.text, passwordController.text))
        .fold((failure) {
      emit(
        state.copyWith(
            authStatus: AuthStatus.failure, errorMassage: failure.errorMassage),
      );
    }, (success) {
      saveUser();
      emit(state.copyWith(authStatus: AuthStatus.success));
    });
  }

  Future<void> saveUser() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    (await _saveUserUseCase.execute(UserEntity(
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      age: ageController.text,
      email: emailController.text,
    )))
        .fold((failure) {
      emit(
        state.copyWith(
            authStatus: AuthStatus.failure, errorMassage: failure.errorMassage),
      );
    }, (success) {
      emit(state.copyWith(authStatus: AuthStatus.success));
    });
  }
}
