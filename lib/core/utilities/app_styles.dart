import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static const String fontFamily = 'Rubik';
  static TextStyle onBoardingTitleStyle() {
    return TextStyle(
      color: AppColors.darkGryColor,
      fontSize: 30.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle onBoardingSubTitleStyle() {
    return TextStyle(
      color: AppColors.gryColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w200,
    );
  }
  static TextStyle buttonTextStyle(){
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
       color: AppColors.whitColor
    );
  }
  static TextStyle textButtonStyle(){
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
        color: AppColors.darkGryColor
    );
  }
  static TextStyle titleStyle(){
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: AppColors.darkGryColor
    );
  }
  static TextStyle subTitleStyle(){
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: AppColors.gryColor
    );
  }
  static TextStyle hintStyle(){
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: AppColors.gryColor
    );
  }
  static TextStyle errorStyle(){
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: AppColors.gryColor
    );
  }
  static TextStyle darkGry16W600(){
    return  TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGryColor,
    );
  }
}
