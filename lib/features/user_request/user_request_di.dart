import 'package:ayeenh/features/user_request/data/data_source.dart';
import 'package:ayeenh/features/user_request/data/remote/firebase_helper.dart';
import 'package:ayeenh/features/user_request/data/repository/request_user_repository_impl.dart';
import 'package:ayeenh/features/user_request/domain/repository/request_user_repository.dart';
import 'package:ayeenh/features/user_request/presentation/logic/cubit.dart';
import 'package:get_it/get_it.dart';

import 'domain/use_cases/send_user_request_use_case.dart';

final requestDi = GetIt.instance;

Future<void> initUserRequestModule() async {
  requestDi.registerLazySingleton<RequestDataSource>(
        () => FirebaseHelperUserRequest(),
  );
  requestDi.registerLazySingleton<RequestUserRepository>(
        () => RequestUserRepositoryImpl(
    requestUserDataSource: requestDi()
    ),
  );
  requestDi.registerLazySingleton<SendUserRequestUseCase>(
        () => SendUserRequestUseCase(
      requestUserRepository: requestDi(),
    ),
  );
  requestDi.registerLazySingleton<RequestUserCubit>(
        () => RequestUserCubit(
     sendUserRequestUseCase:  requestDi(),
    ),
  );
}