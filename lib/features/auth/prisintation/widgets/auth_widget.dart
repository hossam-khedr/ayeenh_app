import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';

class AuthWidget extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  const AuthWidget(
      {super.key, required this.title, this.onTap, required this.isSelected});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        width: 150.w,
        height: 40.h,
        decoration: BoxDecoration(
          color:
              widget.isSelected ? AppColors.primaryColor : AppColors.whitColor,
          borderRadius: BorderRadius.circular(AppSized.constantRadius),
          border: Border.all(
            color:AppColors.darkGryColor,
            width:widget.isSelected ? 1 : 0.5,
          ),
        ),
        child: Text(
          widget.title,
          style: AppStyles.titleStyle().copyWith(
            color: widget.isSelected ?AppColors.whitColor:AppColors.darkGryColor,
            fontSize: widget.isSelected ?16.sp:12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
