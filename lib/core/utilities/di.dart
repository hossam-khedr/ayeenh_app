import 'package:ayeenh/features/auth/data/data_source/data_source.dart';
import 'package:ayeenh/features/auth/data/data_source/remot/auth_remot_data_source.dart';
import 'package:ayeenh/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:ayeenh/features/auth/domain/repo/auth_repo.dart';
import 'package:ayeenh/features/auth/domain/use_case/login_usecase.dart';
import 'package:ayeenh/features/auth/domain/use_case/register_usecase.dart';
import 'package:ayeenh/features/auth/domain/use_case/save_user_usecase.dart';
import 'package:ayeenh/features/auth/prisintation/logic/cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initAuthModule() async {
  // auth data source
  getIt.registerFactory(()=>AuthRemoteDataSource());
  getIt.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
  //auth repo
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(authRemoteDataSource: getIt()));
  // cubit
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(), getIt(), getIt()));
// use case
  getIt.registerFactory(() => LoginUseCase(authRepo: getIt()));
  getIt.registerFactory(() => RegisterUseCase(authRepo: getIt()));
  getIt.registerFactory(() => SaveUserUseCase(authRepo: getIt()));
}
