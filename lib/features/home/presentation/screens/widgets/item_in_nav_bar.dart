import 'package:ayeenh/core/utilities/app_colors.dart';
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
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 80.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? AppColors.whitColor
                  : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                  color: widget.isSelected
                      ? AppColors.darkGryColor
                      : AppColors.primaryColor,
                  width: widget.isSelected ? 1.0 : 0.0),
            ),
            child: Icon(
              widget.icon,
              color: widget.isSelected
                  ? AppColors.primaryColor
                  : AppColors.whitColor,
            ),
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: widget.isSelected
                  ? AppColors.darkGryColor
                  : AppColors.whitColor,
            ),
          ),
        ],
      ),
    );
  }
}
