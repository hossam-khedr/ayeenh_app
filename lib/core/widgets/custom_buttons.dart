

import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';

abstract class CustomButtons{
  static Widget normal({
    required String title,
    required void Function()? onTap,
    double? width,
    Color? color,
    IconData? icon,
}){
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        width: width ?? double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSized.constantRadius),
          color: color ?? AppColors.primaryColor,
          border: Border.all(
            color: AppColors.darkGryColor,
            width: 1
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!=null?Icon(icon):const SizedBox.shrink(),
            icon!=null?SizedBox(width: 10.w,):const SizedBox.shrink(),
            Center(
              child: Text(title,style: AppStyles.buttonTextStyle(),),
            ),

          ],
        ),
      ),
    );
  }
}