import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

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
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          // strokeAlign: 15,
          strokeWidth: 5,
        ),
      ),
    );
  }
}

class PobUpErrorState extends StatelessWidget {
  final String errorMassage;

  const PobUpErrorState({super.key, required this.errorMassage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //insetPadding: EdgeInsets.symmetric(horizontal: 150.w),
      child: Container(
           // padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 100.h,
          decoration: BoxDecoration(
              color: AppColors.whitColor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Icon(
                  Icons.error,
                  color: AppColors.favorite,
                  size: 40.w,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                child: Text(
                   //maxLines: 3,
                  //  overflow: TextOverflow.ellipsis,
                  errorMassage,
                  style: AppStyles.errorStyle(),
                ),
              ),

            ],
          )),
    );
  }
}
