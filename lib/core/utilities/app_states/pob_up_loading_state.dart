import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class PobUpLoadingState extends StatelessWidget {
  const PobUpLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 150.w),
      child: Container(
        padding: EdgeInsets.all(10.w),
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.whitColor,
            borderRadius: BorderRadius.circular(5.r)),
        child: const CupertinoActivityIndicator(
          color: AppColors.bluColor,
          radius: 10,
        ),
      ),
    );
  }
}


