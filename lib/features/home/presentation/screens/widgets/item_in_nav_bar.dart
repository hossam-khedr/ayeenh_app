import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemInNavBar extends StatefulWidget {
  final bool isSelected;
  final String label;
  final IconData icon;
  final void Function()? onTap;

  const ItemInNavBar(
      {super.key,
      required this.isSelected,
      this.onTap,
      required this.label,
      required this.icon});

  @override
  State<ItemInNavBar> createState() => _ItemInNavBarState();
}

class _ItemInNavBarState extends State<ItemInNavBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          color: widget.isSelected
              ? AppColors.bluColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              widget.icon,
              color: widget.isSelected
                  ? AppColors.whitColor
                  : AppColors.gryColor,
            ),
           Divider(
             height: 20,
             endIndent: 5,
             indent: 5,
             color: widget.isSelected?AppColors.whitColor:Colors.transparent,
           )
           /* Text(
              widget.label,
              style: AppStyles.subTitleStyle(
              ).copyWith(
                color: widget.isSelected
                    ? AppColors.whitColor
                    : AppColors.gryColor,
                fontSize: 10.sp
              ),
            ),*/
          ],
        )
      ),
    );
  }
}
