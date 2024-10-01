import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/helper_functions.dart';
import 'package:ayeenh/features/chat_pot/data/models/massage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class MassageItem extends StatefulWidget {
  final MassageModel massageModel;

  const MassageItem({super.key, required this.massageModel});

  @override
  State<MassageItem> createState() => _MassageItemState();
}

class _MassageItemState extends State<MassageItem> {
  @override
  Widget build(BuildContext context) {
    return widget.massageModel.isUser
        ? Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.warning,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.massageModel.massage),
                  Text(
                    HelperFunctions.formatTime(widget.massageModel.dateTime),
                    style: AppStyles.subTitleStyle()
                        .copyWith(color: AppColors.darkGryColor),
                  ),
                ],
              ),
            ),
          )
        : Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackGroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                    // bottomLeft: Radius.circular(10.r),
                    topLeft: Radius.circular(30.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.massageModel.massage),
                  Text(
                    HelperFunctions.formatTime(widget.massageModel.dateTime),
                    style: AppStyles.subTitleStyle()
                        .copyWith(color: AppColors.darkGryColor),
                  ),
                ],
              ),
            ),
          );
  }
}
