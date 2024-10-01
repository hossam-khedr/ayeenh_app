import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

ThemeData appThemeLight(){
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.bluColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.bluColor,
      secondary: AppColors.bluColor,
      onSecondary: AppColors.warning,
      surface: AppColors.whitColor,
      background: AppColors.whitColor,
      onPrimary: Colors.white,
    ),
    fontFamily: AppStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor
  );
}