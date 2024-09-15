import 'package:ayeenh/features/opening_app/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';

class OnBoardingIndicator extends StatefulWidget {
  final int pageNum;
  const OnBoardingIndicator({super.key, required this.pageNum});

  @override
  State<OnBoardingIndicator> createState() => _OnBoardingIndicatorState();
}

class _OnBoardingIndicatorState extends State<OnBoardingIndicator> {
  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];
    for (int i = 0; i < OnBoardingModel.getDataModel.length; i++) {
      indicators.add(
        Container(
          width: 40.w,
          height: 10.h,
          decoration: BoxDecoration(
            color:widget.pageNum ==i? AppColors.whitColor:AppColors.bluColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color:widget.pageNum ==i? AppColors.bluColor:AppColors.whitColor,
              width:widget.pageNum ==i?2:1
            ),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}
