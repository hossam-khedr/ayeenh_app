import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemInNavBar extends StatefulWidget {
  final bool isSelected;
  final String label;
  final String iconPath;
  final void Function()? onTap;

  const ItemInNavBar(
      {super.key,
      required this.isSelected,
      this.onTap,
      required this.label,
      required this.iconPath});

  @override
  State<ItemInNavBar> createState() => _ItemInNavBarState();
}

class _ItemInNavBarState extends State<ItemInNavBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
          padding: EdgeInsets.all(10.w),
          width: 60.w,
          height: 30.h,
          decoration: BoxDecoration(
            //shape: BoxShape.circle,
            color: widget.isSelected ? AppColors.warning : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            widget.label,
            style: AppStyles.subTitleStyle().copyWith(
              color: widget.isSelected?AppColors.whitColor:AppColors.gryColor,
              fontSize: 10.sp
            ),
          )),
    );
  }
}
