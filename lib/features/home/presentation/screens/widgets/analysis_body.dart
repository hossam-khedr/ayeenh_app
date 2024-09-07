import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:ayeenh/features/home/domain/entities/anlytics_category_model.dart';
import 'package:ayeenh/features/home/presentation/logic/cubit.dart';
import 'package:ayeenh/features/home/presentation/logic/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilities/app_colors.dart';
import 'analysis_item.dart';

class AnalysisBody extends StatefulWidget {
  const AnalysisBody({super.key});

  @override
  State<AnalysisBody> createState() => _AnalysisBodyState();
}

class _AnalysisBodyState extends State<AnalysisBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllAnalysis();
  }

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
        BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state.isLoading) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.isFailure) {
              return SliverToBoxAdapter(
                child: Text(state.errorMassage ?? 'Custom Error'),
              );
            }
            if (state.isSuccess) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: state.analysis.length,
                  (context, index) => Container(
                      alignment: AlignmentDirectional.center,
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      //  width: double.infinity,
                      //height: 70.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          border: Border.all(
                              color: AppColors.primaryColor, width: 0.5),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: AnalysisItem(
                        analysisCount: state.analysis[index].analysisCount,
                        analysisName: state.analysis[index].name ,
                        analysisPrise: state.analysis[index].analysisPrise,
                        onTap: (){
                          context.push(
                            // "detailsCategory",
                              RoutesName.userRequest,
                              extra: state.analysis[index]);
                        },
                      )
                     ),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Text('No Data'),
              );
            }
          },
        ),
      ],
    );
  }
}
