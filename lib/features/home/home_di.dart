import 'package:ayeenh/features/home/data/data_source/data_source.dart';
import 'package:ayeenh/features/home/data/data_source/remote/firebase_helper.dart';
import 'package:ayeenh/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:ayeenh/features/home/domain/repo/home_repo.dart';
import 'package:ayeenh/features/home/domain/usecase/get_all_analysis_use_case.dart';
import 'package:ayeenh/features/home/presentation/logic/cubit.dart';
import 'package:get_it/get_it.dart';

final homeDi = GetIt.instance;

Future<void> initHomeModule() async {
  homeDi.registerLazySingleton<HomeDataSource>(
    () => FirebaseHelper(),
  );
  homeDi.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      dataSource: homeDi(),
    ),
  );
  homeDi.registerLazySingleton<GetAllAnalysisUseCase>(
    () => GetAllAnalysisUseCase(
      homeRepo: homeDi(),
    ),
  );
  homeDi.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getAllAnalysisUseCase: homeDi(),
    ),
  );
}
