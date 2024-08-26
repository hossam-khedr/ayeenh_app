import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class AddRequestSuccess extends StatefulWidget {
  const AddRequestSuccess({super.key});

  @override
  State<AddRequestSuccess> createState() => _AddRequestSuccessState();
}

class _AddRequestSuccessState extends State<AddRequestSuccess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.whitColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 100.h,
            color: AppColors.success,
          ),
          Text(
            'add_request_success_massage'.tr(),
            style: AppStyles.titleStyle().copyWith(color: AppColors.gryColor),
          ),
          Text(
            'add_request_hint_massage'.tr(),
            style: AppStyles.subTitleStyle().copyWith(
              color: AppColors.darkGryColor,
              fontSize: 14.sp
            ),
          ),

        ],
      ),
    );
  }
}
