import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/helper_functions.dart';
import 'package:ayeenh/features/user_request/presentation/logic/cubit.dart';
import 'package:ayeenh/features/user_request/presentation/logic/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';

class RequestDate extends StatefulWidget {
  const RequestDate({super.key});

  @override
  State<RequestDate> createState() => _RequestDateState();
}

class _RequestDateState extends State<RequestDate> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RequestUserCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<RequestUserCubit, RequestUserStates>(
          builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 45.h,
          decoration: BoxDecoration(
              color: AppColors.scaffoldBackGroundColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  cubit.selectedDate == null
                      ? 'date'.tr()
                      : HelperFunctions.formatDateTime(cubit.selectedDate!),
                  style: AppStyles.hintStyle(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cubit.requestDataSelected(context);
                },
                child: Container(
                  width: 120.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r),
                    ),
                  ),
                  child: const Icon(
                    Icons.date_range,
                    color: AppColors.whitColor,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
