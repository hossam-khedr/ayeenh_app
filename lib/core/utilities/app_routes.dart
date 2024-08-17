import 'package:ayeenh/features/opening_app/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/opening_app/splash/splash_screen.dart';

abstract class AppRoutes {
  static final Map<String, WidgetBuilder> _routes = {
    RoutesName.splash: (context) => const SplashScreen(),
    RoutesName.onBoarding: (context) => const OnBoardingScreen()
  };

  static Map<String, WidgetBuilder> get routes => _routes;
}

abstract class RoutesName {
  static const splash = 'splash';
  static const onBoarding = 'onBoarding';
}
