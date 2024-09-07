import 'package:ayeenh/features/auth/prisintation/logic/cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/data_source.dart';
import 'data/data_source/remot/auth_remot_data_source.dart';
import 'data/repo_impl/auth_repo_impl.dart';
import 'domain/repo/auth_repo.dart';
import 'domain/use_case/login_usecase.dart';
import 'domain/use_case/register_usecase.dart';
import 'domain/use_case/save_user_usecase.dart';

final authDi = GetIt.instance;
  Future<void> initAuthModule() async {
    // auth data source
    authDi.registerFactory(()=>AuthRemoteDataSource());
    authDi.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
    //auth repo
    authDi.registerLazySingleton<AuthRepo>(
            () => AuthRepoImpl(authRemoteDataSource: authDi()));
    // cubit
    authDi.registerFactory<AuthCubit>(() => AuthCubit(authDi(), authDi(), authDi()));
// use case
    authDi.registerFactory(() => LoginUseCase(authRepo: authDi()));
    authDi.registerFactory(() => RegisterUseCase(authRepo: authDi()));
    authDi.registerFactory(() => SaveUserUseCase(authRepo: authDi()));
  }
