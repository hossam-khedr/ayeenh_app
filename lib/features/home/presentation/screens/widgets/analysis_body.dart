import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_states/full_screen_empty_state.dart';
import 'package:ayeenh/core/utilities/app_states/full_screen_loading_state.dart';
import 'package:ayeenh/core/widgets/custom_text_form_field.dart';
import 'package:ayeenh/features/home/presentation/logic/cubit.dart';
import 'package:ayeenh/features/home/presentation/logic/state.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/bot_icon.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/search_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
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
  TextEditingController searchController = TextEditingController();

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
          child: Row(
            children: [
              Expanded(
                  child: SearchBarWidget(
                searchController: searchController,
              )),
              const BotIcon(),
            ],
          ),
        ),
        BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state.isLoading) {
              return const SliverToBoxAdapter(
                child: FullScreenLoadingState(),
              );
            }
            if (state.isFailure) {
              return SliverToBoxAdapter(
                child: Text(state.errorMassage ?? 'Custom Error'),
              );
            }
            if (state.isSuccess) {
              if (state.analysis.isEmpty) {
                return const SliverToBoxAdapter(
                  child: FullScreenEmptyState(
                    message: 'list_is_empty',
                  ),
                );
              }
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0.w,
                  mainAxisSpacing: 1.0.h,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: searchController.text.isEmpty
                      ? state.analysis.length
                      : state.filterAnalysis.length,
                  (context, index) => Container(
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                          color: AppColors.whitColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: AnalysisItem(
                        analysisCount: searchController.text.isEmpty
                            ? state.analysis[index].analysisCount
                            : state.filterAnalysis[index].analysisCount,
                        analysisName: searchController.text.isEmpty
                            ? state.analysis[index].name
                            : state.filterAnalysis[index].name,
                        analysisPrise: searchController.text.isEmpty
                            ? state.analysis[index].analysisPrise
                            : state.filterAnalysis[index].analysisPrise,
                        onTap: () {
                          context.push(
                            // "detailsCategory",
                            RoutesName.userRequest,
                            extra: searchController.text.isEmpty
                                ? state.analysis[index]
                                : state.filterAnalysis[index],
                          );
                        },
                      )),
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
