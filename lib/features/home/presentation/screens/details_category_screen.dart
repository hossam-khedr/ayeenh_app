import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/widgets/main_app_scaffold.dart';
import '../../domain/entities/anlytics_category_model.dart';

class DetailsCategoryScreen extends StatefulWidget {
  const DetailsCategoryScreen({
    super.key,
  });

  @override
  State<DetailsCategoryScreen> createState() => _DetailsCategoryScreenState();
}

class _DetailsCategoryScreenState extends State<DetailsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final model =
        ModalRoute.of(context)!.settings.arguments as AnalysisCategoryModel;
    return MainAppScaffold(
      shooAppBar: true,
      changeToolbarColor: true,
      centerAppBarTitle: true,
      appBarTitle: model.title,
      appBarColor: AppColors.primaryColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppSized.horizontalPaddingConst),
        child: Column(
          children: [
            AppSizedBox.sizeBoxH20,
            Container(
              padding: EdgeInsets.all(20.w),
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10.r)),
              child: ListView.builder(
                  itemCount: model.categoryDetails.analysisType.length,
                  itemBuilder: (context, index) {
                    return Text(
                      model.categoryDetails.analysisType[index],
                      style:
                          AppStyles.subTitleStyle().copyWith(fontSize: 16.sp),
                    );
                  }),
            ),
            AppSizedBox.sizeBoxH20,
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('analysis_price'.tr()),
            ),
            AppSizedBox.sizeBoxH10,
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                alignment: AlignmentDirectional.center,
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: BorderRadius.circular(10)),
                child: Text('${model.categoryDetails.price} ج م'),
              ),
            ),
            AppSizedBox.sizeBoxH20,
            CustomButtons.normal(
              width: 250.w,
              title: 'add_request'.tr(),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                      color: AppColors.whitColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
