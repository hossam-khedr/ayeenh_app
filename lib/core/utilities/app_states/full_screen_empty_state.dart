import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FullScreenEmptyState extends StatelessWidget {
  final String message;

  const FullScreenEmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgIcons.emptyIcon,
            color: AppColors.bluColor,
            height: 50.h,
            width: 50.w,
          ),
          Text(
            message,
            style: AppStyles.titleStyle().copyWith(
              color: AppColors.gryColor,
            ),
          ),
        ],
      ),
    );
  }
}
