import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_routes.dart';

class BotIcon extends StatefulWidget {
  const BotIcon({super.key, });

  @override
  State<BotIcon> createState() => _BotIconState();
}

class _BotIconState extends State<BotIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GestureDetector(
        onTap:() => context.push(RoutesName.bot),
        child: Chip(
          label: Text(
            "inquiries".tr(),
            style: AppStyles.subTitleStyle().copyWith(color: AppColors.whitColor),
          ),
          avatar: const Icon(
            Icons.message_outlined,
            size: 15,
            color: AppColors.whitColor,
          ),
          backgroundColor: AppColors.warning,
         side: BorderSide.none,
        ),
      ),
    );
  }
}
