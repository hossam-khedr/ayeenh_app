import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';
import 'item_in_nav_bar.dart';

class CustomNavBar extends StatefulWidget {
 final List<Widget> itemsInNavBar;
  const CustomNavBar({super.key, required this.itemsInNavBar});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppSized.constantRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
          widget.itemsInNavBar
      ),
    );
  }
}
