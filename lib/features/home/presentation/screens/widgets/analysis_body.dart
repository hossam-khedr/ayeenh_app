import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:ayeenh/core/widgets/custom_text_form_field.dart';
import 'package:ayeenh/features/home/domain/entities/anlytics_category_model.dart';
import 'package:ayeenh/features/opening_app/data/models/on_boarding_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class AnalysisBody extends StatefulWidget {
  const AnalysisBody({super.key});

  @override
  State<AnalysisBody> createState() => _AnalysisBodyState();
}

class _AnalysisBodyState extends State<AnalysisBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
              alignment: AlignmentDirectional.topCenter,
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.whitColor,
                borderRadius: BorderRadius.circular(AppSized.constantRadius),
                // border: Border.all(color: AppColors.gryColor, width: 1.0),
              ),
              child: Image.asset(PngIcons.homeImage)),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: AnalysisCategoryModel.analysisCategory.length,
            semanticIndexOffset: 10,
            (context, index) => Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 8.h),
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                  color: AppColors.whitColor.withOpacity(0.4),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                AnalysisCategoryModel.analysisCategory[index].title,
              ),
            ),
          ),
        ),
      ],
    );

  }
}
