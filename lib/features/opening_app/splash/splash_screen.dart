import 'dart:async';

import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_routes.dart';
import '../../../core/utilities/svg_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 late Timer _timer;
  void startTimer(){
    _timer = Timer(const Duration(seconds: 3), _nextScreen);
  }
  _nextScreen(){
    Navigator.pushReplacementNamed(context, RoutesName.onBoarding);
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      appBarColor: AppColors.primaryColor,
      scaffoldColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          SvgIcons.appLogoIcon,
          height: 70.h,
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
