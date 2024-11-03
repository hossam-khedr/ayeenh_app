import 'dart:async';

import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/opening_app/logic/cubit.dart';
import 'package:ayeenh/features/opening_app/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
   // Navigator.pushReplacementNamed(context, RoutesName.selectLanguage);
    context.go(RoutesName.selectLanguage);
  }
  @override
  void initState() {
    super.initState();
   // BlocProvider.of<OpeningCubit>(context).initSplash();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<OpeningCubit,OpeningStates>(
      listener: (context , state){
        // if(state.isSelectedLangSuccess ){
        //   context.go(RoutesName.onBoarding);
        // }else if(state.isUnSelectedLangSuccess){
        //   context.go(RoutesName.selectLanguage);
        // }
        // else if(state.isOnBoardingViewsSuccess){
        //   context.go(RoutesName.auth);
        // }
      },
      child: MainAppScaffold(
        appBarColor: AppColors.bluColor,
        scaffoldColor: AppColors.bluColor,
        body: Center(
          child: SvgPicture.asset(
            SvgIcons.appLogoIcon,
            height: 70.h,
          ),
        ),
      ),
    );
  }
}
