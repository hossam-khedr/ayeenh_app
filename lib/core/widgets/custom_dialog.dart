import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.favorite
              ),
            ),
          )
        ],
      )
    );
  }
}
