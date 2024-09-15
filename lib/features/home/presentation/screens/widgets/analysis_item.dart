import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_routes.dart';
import '../../../../../core/utilities/app_styles.dart';

class AnalysisItem extends StatefulWidget {
  final String analysisName;
  final String analysisPrise;
  final String analysisCount;
  final void Function()? onTap;

  const AnalysisItem(
      {super.key,
      required this.analysisName,
      required this.analysisPrise,
      required this.analysisCount,
      this.onTap});

  @override
  State<AnalysisItem> createState() => _AnalysisItemState();
}

class _AnalysisItemState extends State<AnalysisItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          widget.analysisName,
          style:
              AppStyles.subTitleStyle().copyWith(color: AppColors.darkGryColor),
        ),
        Text(
          'يشمل${widget.analysisCount}تحليل',
          style: AppStyles.subTitleStyle().copyWith(color: AppColors.gryColor),
        ),
        Text(
          '${widget.analysisPrise} / ج م',
          style: AppStyles.subTitleStyle().copyWith(color: AppColors.success),
        ),
        InkWell(
          onTap: widget.onTap,
          child: Container(
            alignment: AlignmentDirectional.center,
            height: 25.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: AppColors.bluColor,
                border: Border.all(color: AppColors.darkGryColor, width: 0.4),
                borderRadius: BorderRadius.circular(4.r)),
            child: Text(
              'add_request'.tr(),
              style: AppStyles.subTitleStyle().copyWith(
                color: AppColors.whitColor
              ),
            ),
          ),
        )
      ],
    );
  }
}
