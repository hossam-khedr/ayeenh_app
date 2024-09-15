import 'package:ayeenh/features/app_utils/presentation/screens/settings_screen.dart';
import 'package:ayeenh/features/auth/auth_di.dart';
import 'package:ayeenh/features/auth/prisintation/logic/cubit.dart';
import 'package:ayeenh/features/auth/prisintation/screens/auth_screen.dart';
import 'package:ayeenh/features/home/home_di.dart';
import 'package:ayeenh/features/home/presentation/logic/cubit.dart';
import 'package:ayeenh/features/user_request/presentation/logic/cubit.dart';
import 'package:ayeenh/features/user_request/presentation/screens/use_request_screen.dart';
import 'package:ayeenh/features/home/presentation/screens/home_screen.dart';
import 'package:ayeenh/features/opening_app/on_boarding/on_boarding_screen.dart';
import 'package:ayeenh/features/opening_app/select_language/select_language_screen.dart';
import 'package:ayeenh/features/user_request/user_request_di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/analysis_model.dart';
import '../../features/home/domain/entities/anlytics_category_model.dart';
import '../../features/opening_app/splash/splash_screen.dart';

abstract class AppRoutes {
  static final GoRouter _goRoute = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: RoutesName.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutesName.selectLanguage,
      builder: (context, state) => const SelectLanguageScreen(),
    ),
    GoRoute(
      path: RoutesName.onBoarding,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: RoutesName.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: RoutesName.auth,
      builder: (context, state) => BlocProvider(
        create: (context) => authDi<AuthCubit>(),
        child: const AuthScreen(),
      ),
    ),
    GoRoute(
      path: RoutesName.home,
      builder: (context, state) => BlocProvider(
        create: (context) => homeDi<HomeCubit>(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
        path: RoutesName.userRequest,
        // name: 'detailsCategory',
        builder: (context, state) {
          AnalysisModel model = state.extra as AnalysisModel;
          return BlocProvider(
            create: (context)=>requestDi<RequestUserCubit>(),
            child: UserRequestScreen(model: model),
          );
        }),
  ]);



  static GoRouter get routes => _goRoute;
}

abstract class RoutesName {
  static const splash = '/';
  static const selectLanguage = '/selectLanguage';
  static const onBoarding = '/onBoarding';
  static const auth = '/auth';
  static const login = '/login';
  static const home = '/home';
  static const userRequest = '/userRequest';
  static const settings = '/settings';
}
