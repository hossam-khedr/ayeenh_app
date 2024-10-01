import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/features/home/domain/entities/request_model.dart';
import 'package:ayeenh/features/user_request/data/models/user_request_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRequestItem extends StatefulWidget {
  final UserRequestModel userRequestModel;

  const UserRequestItem({super.key, required this.userRequestModel});

  @override
  State<UserRequestItem> createState() => _UserRequestItemState();
}

class _UserRequestItemState extends State<UserRequestItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      // width: 250.w,
      height: 100.h,
      decoration: BoxDecoration(
          color: AppColors.whitColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSizedBox.sizeBoxH20,
                Text(
                  widget.userRequestModel.dateTime,
                  style: AppStyles.titleStyle().copyWith(
                    fontSize: 14.sp,
                    color: AppColors.gryColor,
                    decoration: widget.userRequestModel.isStatus
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Text(
                  widget.userRequestModel.analysisType,
                  style: AppStyles.titleStyle().copyWith(
                    fontSize: 14.sp,
                    color: AppColors.gryColor,
                    decoration: widget.userRequestModel.isStatus
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    color: AppColors.scaffoldBackGroundColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    Text(
                      widget.userRequestModel.isStatus
                          ? 'analysis_done'.tr()
                          : 'analysis_inProgress'.tr(),
                      style: AppStyles.subTitleStyle().copyWith(
                          color: widget.userRequestModel.isStatus
                              ? AppColors.success
                              : AppColors.warning),
                    ),
                    Icon(
                      widget.userRequestModel.isStatus
                          ? Icons.done_all_outlined
                          : Icons.timer,
                      color: widget.userRequestModel.isStatus
                          ? AppColors.success
                          : AppColors.warning,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
