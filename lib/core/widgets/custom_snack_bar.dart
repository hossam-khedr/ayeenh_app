
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';

enum SnackBarType { success, error, warning, info }

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String massage,
    SnackBarType snackBarType = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      content:
          CustomSnackBarContent(massage: massage, snackBarType: snackBarType),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CustomSnackBarContent extends StatelessWidget {
  final String massage;
  final SnackBarType snackBarType;

  const CustomSnackBarContent(
      {super.key, required this.massage, required this.snackBarType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: _getBackGroundColor(),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGryColor.withOpacity(0.1),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(
            _getIcons(),
            color: AppColors.whitColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              massage,
              style: TextStyle(color: AppColors.whitColor, fontSize: 12.sp),
            ),
          )
        ],
      ),
    );
  }

  Color _getBackGroundColor() {
    switch (snackBarType) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.warning:
        return Colors.orange;
      case SnackBarType.info:
        return Colors.grey;
    }
  }

  IconData _getIcons() {
    switch (snackBarType) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
    }
  }
}
