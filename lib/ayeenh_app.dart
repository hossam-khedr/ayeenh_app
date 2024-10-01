import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utilities/app_themes.dart';

class AyeenhApp extends StatelessWidget {
  const AyeenhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return  MaterialApp.router(
          debugShowCheckedModeBanner: false,
        theme: appThemeLight(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
       //initialRoute: RoutesName.splash,
         routerConfig: AppRoutes.routes,
        );
      },
    );
  }
}
