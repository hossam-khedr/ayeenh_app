import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageWidget extends StatefulWidget {
  final String image;
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  const LanguageWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.isSelected,
      this.onTap});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 120.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? AppColors.bluColor.withOpacity(0.2)
              : AppColors.whitColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color:
                widget.isSelected ? AppColors.bluColor : AppColors.gryColor,
            width: widget.isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              widget.image,
              height: 30.h,
            ),
            Text(
              widget.title,
              style: AppStyles.darkGry16W600().copyWith(
                color: widget.isSelected
                    ? AppColors.bluColor
                    : AppColors.gryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
