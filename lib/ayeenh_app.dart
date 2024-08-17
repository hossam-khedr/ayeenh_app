import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/features/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AyeenhApp extends StatelessWidget {
  const AyeenhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
         routes: AppRoutes.routes,
        );
      },
    );
  }
}
