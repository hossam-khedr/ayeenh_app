import 'package:ayeenh/core/utilities/di.dart';
import 'package:ayeenh/features/auth/prisintation/logic/cubit.dart';
import 'package:ayeenh/features/auth/prisintation/screens/auth_screen.dart';
import 'package:ayeenh/features/auth/prisintation/screens/login_screen.dart';
import 'package:ayeenh/features/home/presentation/screens/details_category_screen.dart';
import 'package:ayeenh/features/home/presentation/screens/home_screen.dart';
import 'package:ayeenh/features/opening_app/on_boarding/on_boarding_screen.dart';
import 'package:ayeenh/features/opening_app/select_language/select_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/opening_app/splash/splash_screen.dart';

abstract class AppRoutes {
  static final Map<String, WidgetBuilder> _routes = {
    RoutesName.splash: (context) => const SplashScreen(),
    RoutesName.selectLanguage: (context) => const SelectLanguageScreen(),
    RoutesName.onBoarding: (context) => const OnBoardingScreen(),
    RoutesName.auth: (context) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const AuthScreen(),
        ),
    RoutesName.home: (context) => const HomeScreen(),
    RoutesName.detailsCategory: (context) => const DetailsCategoryScreen(),
  };

  static Map<String, WidgetBuilder> get routes => _routes;
}

abstract class RoutesName {
  static const splash = 'splash';
  static const selectLanguage = 'selectLanguage';
  static const onBoarding = 'onBoarding';
  static const auth = 'auth';
  static const login = 'login';
  static const home = 'home';
  static const detailsCategory = 'detailsCategory';
}
